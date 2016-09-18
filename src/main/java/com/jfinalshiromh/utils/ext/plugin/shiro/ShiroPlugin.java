
package com.jfinalshiromh.utils.ext.plugin.shiro;

import com.jfinal.config.Routes;
import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;
import com.jfinal.plugin.IPlugin;
import org.apache.shiro.authz.annotation.*;

import java.lang.annotation.Annotation;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map.Entry;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;


@SuppressWarnings("unchecked")
public class ShiroPlugin implements IPlugin {

    
    private String successUrl = "/admin/index";

    
    private String loginUrl = "/adminlogin";


    
    private String unauthorizedUrl = "/401";


    private final String SLASH = "/";

    
    private static final Class<? extends Annotation>[] AUTHZ_ANNOTATION_CLASSES = new Class[]{
            RequiresPermissions.class, RequiresRoles.class, RequiresUser.class,
            RequiresGuest.class, RequiresAuthentication.class};

    
    private final Routes routes;

    
    public ShiroPlugin(Routes routes) {
        this.routes = routes;
    }

    
    public boolean stop() {
        return true;
    }

    
    public boolean start() {
        Set<String> excludedMethodName = buildExcludedMethodName();
        ConcurrentMap<String, AuthzHandler> authzMaps = new ConcurrentHashMap<String, AuthzHandler>();
        
        
        for (Entry<String, Class<? extends Controller>> entry : routes
                .getEntrySet()) {
            Class<? extends Controller> controllerClass = entry.getValue();

            String controllerKey = entry.getKey();

            
            List<Annotation> controllerAnnotations = getAuthzAnnotations(controllerClass);
            
            Method[] methods = controllerClass.getMethods();
            for (Method method : methods) {
                
                if (!excludedMethodName.contains(method.getName())
                        && method.getParameterTypes().length == 0) {
                    
                    if (isClearShiroAnnotationPresent(method)) {
                        continue;
                    }
                    
                    List<Annotation> methodAnnotations = getAuthzAnnotations(method);
                    
                    AuthzHandler authzHandler = createAuthzHandler(
                            controllerAnnotations, methodAnnotations);
                    
                    if (authzHandler != null) {
                        
                        String actionKey = createActionKey(controllerClass, method, controllerKey);
                        
                        authzMaps.put(actionKey, authzHandler);
                    }
                }
            }
        }
        
        ShiroKit.init(authzMaps);
        
        ShiroKit.setLoginUrl(loginUrl);
        ShiroKit.setSuccessUrl(successUrl);
        ShiroKit.setUnauthorizedUrl(unauthorizedUrl);
        return true;
    }

    
    private Set<String> buildExcludedMethodName() {
        Set<String> excludedMethodName = new HashSet<String>();
        Method[] methods = Controller.class.getMethods();
        for (Method m : methods) {
            if (m.getParameterTypes().length == 0)
                excludedMethodName.add(m.getName());
        }
        return excludedMethodName;
    }

    
    private AuthzHandler createAuthzHandler(
            List<Annotation> controllerAnnotations,
            List<Annotation> methodAnnotations) {

        
        if (controllerAnnotations.size() == 0 && methodAnnotations.size() == 0) {
            return null;
        }
        
        List<AuthzHandler> authzHandlers = new ArrayList<AuthzHandler>(5);
        for (int index = 0; index < 5; index++) {
            authzHandlers.add(null);
        }

        
        scanAnnotation(authzHandlers, controllerAnnotations);
        
        scanAnnotation(authzHandlers, methodAnnotations);

        
        List<AuthzHandler> finalAuthzHandlers = new ArrayList<AuthzHandler>();
        for (AuthzHandler a : authzHandlers) {
            if (a != null) {
                finalAuthzHandlers.add(a);
            }
        }
        authzHandlers = null;
        
        if (finalAuthzHandlers.size() > 1) {
            return new CompositeAuthzHandler(finalAuthzHandlers);
        }
        
        return finalAuthzHandlers.get(0);
    }

    
    private void scanAnnotation(List<AuthzHandler> authzArray,
                                List<Annotation> annotations) {
        if (null == annotations || 0 == annotations.size()) {
            return;
        }
        for (Annotation a : annotations) {
            if (a instanceof RequiresRoles) {
                authzArray.set(0, new RoleAuthzHandler(a));
            } else if (a instanceof RequiresPermissions) {
                authzArray.set(1, new PermissionAuthzHandler(a));
            } else if (a instanceof RequiresAuthentication) {
                authzArray.set(2, AuthenticatedAuthzHandler.me());
            } else if (a instanceof RequiresUser) {
                authzArray.set(3, UserAuthzHandler.me());
            } else if (a instanceof RequiresGuest) {
                authzArray.set(4, GuestAuthzHandler.me());
            }
        }
    }

    
    private String createActionKey(Class<? extends Controller> controllerClass,
                                   Method method, String controllerKey) {
        String methodName = method.getName();
        String actionKey = "";

        ActionKey ak = method.getAnnotation(ActionKey.class);
        if (ak != null) {
            actionKey = ak.value().trim();
            if ("".equals(actionKey))
                throw new IllegalArgumentException(controllerClass.getName() + "." + methodName + "(): The argument of ActionKey can not be blank.");
            if (!actionKey.startsWith(SLASH))
                actionKey = SLASH + actionKey;
        } else if (methodName.equals("index")) {
            actionKey = controllerKey;
        } else {
            actionKey = controllerKey.equals(SLASH) ? SLASH + methodName : controllerKey + SLASH + methodName;
        }
        return actionKey;
    }

    
    private List<Annotation> getAuthzAnnotations(Method method) {
        List<Annotation> annotations = new ArrayList<Annotation>();
        for (Class<? extends Annotation> annClass : AUTHZ_ANNOTATION_CLASSES) {
            Annotation a = method.getAnnotation(annClass);
            if (a != null) {
                annotations.add(a);
            }
        }
        return annotations;
    }

    
    private List<Annotation> getAuthzAnnotations(
            Class<? extends Controller> targetClass) {
        List<Annotation> annotations = new ArrayList<Annotation>();
        for (Class<? extends Annotation> annClass : AUTHZ_ANNOTATION_CLASSES) {
            Annotation a = targetClass.getAnnotation(annClass);
            if (a != null) {
                annotations.add(a);
            }
        }
        return annotations;
    }

    
    private boolean isClearShiroAnnotationPresent(Method method) {
        Annotation a = method.getAnnotation(ClearShiro.class);
        if (a != null) {
            return true;
        }
        return false;
    }

    
    public final void setSuccessUrl(String successUrl) {
        this.successUrl = successUrl;
    }

    
    public final void setLoginUrl(String loginUrl) {
        this.loginUrl = loginUrl;
    }

    
    public final void setUnauthorizedUrl(String unauthorizedUrl) {
        this.unauthorizedUrl = unauthorizedUrl;
    }
}
