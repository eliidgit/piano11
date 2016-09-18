package com.jfinalshiromh.module.index;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jfinal.kit.HashKit;
import com.jfinalshiromh.common.BaseController;
import com.jfinalshiromh.common.Constants;
import com.jfinalshiromh.module.greetings.Greetings;
import com.jfinalshiromh.module.greetings.GreetingsVersion;
import com.jfinalshiromh.module.school.School;
import com.jfinalshiromh.module.school.student.score.StudentScore;
import com.jfinalshiromh.module.user.User;
import com.jfinalshiromh.module.valicode.Valicode;
import com.jfinalshiromh.utils.DateUtil;
import com.jfinalshiromh.utils.SMSHelper;
import com.jfinalshiromh.utils.StrUtil;
import com.jfinalshiromh.utils.ext.route.ControllerBind;



@ControllerBind(controllerKey = "/api/index")
public class IndexClientController extends BaseController {

    public void index() {
        
        renderJson("success");
    }

    
    public void phonereg() {
        try {
			String method = getRequest().getMethod();
			if (method.equalsIgnoreCase(Constants.POST)) {
				String phone = getPara("reg_phone");
				String password = getPara("reg_password");
				String nickname = getPara("reg_nickname");
				String schoolId = getPara("schoolId");
				String valicode = getPara("valicode");
				
				String userType = getPara("user_type");

				String open_id = (String) getSession().getAttribute("open_id");
				if (StrUtil.isBlank(schoolId) || StrUtil.isBlank(userType)
						|| StrUtil.isBlank(phone) || StrUtil.isBlank(password)
						|| StrUtil.isBlank(nickname)
						|| StrUtil.isBlank(valicode)) {
					error("请完善注册信息");
				} else {
					if (!StrUtil.isMobile(phone)) {
						error("请输入正确的手机号码");
					} else {
						Valicode code = Valicode.me.findByCodeAndPhone(
								valicode, phone, Constants.REG);

						if (code == null) {
							error("验证码不存在或已使用(已过期)");
						} else {
							User user = User.me.findByPhone(phone);
							if (user != null) {
								error("手机号已经注册，请直接登录");
							} else if (User.me.findByNickname(nickname) != null) {
								error("昵称已经被注册，请更换其他昵称");
							} else {
								String uuid = StrUtil.getUUID();
								String token = StrUtil.getUUID();
								Date date = new Date();
								if (StrUtil.isBlank(open_id)) {
									user = new User();
									user.set("id", uuid)
											.set("nickname",
													StrUtil.noHtml(nickname)
															.trim())
											.set("password",
													HashKit.md5(password))
											.set("in_time", date)
											.set("phone", phone)
											.set("email",
													StrUtil.noHtml(nickname)
															.trim()
															+ "@null.null")
											.set("token", token)
											.set("avatar",
													"/static/img/default_avatar.png")
											.set("type", userType)
											.set("school_id", schoolId).save();
								} else {
									user = getSessionAttr("unsave_user");
									if (user == null) {
										user = new User();
										user.set("id", uuid)
												.set("nickname",
														StrUtil.noHtml(nickname)
																.trim())
												.set("password",
														HashKit.md5(password))
												.set("score", 0)
												.set("mission", date)
												.set("in_time", date)
												.set("phone", phone)
												.set("email",
														StrUtil.noHtml(nickname)
																.trim()
																+ "@null.null")
												.set("token", token)
												.set("avatar",
														"/static/img/default_avatar.png")
												.set("type", userType).save();
									} else {
										user.set("nickname",
												StrUtil.noHtml(nickname).trim())
												.set("password",
														HashKit.md5(password))
												.set("mission", date)
												.set("phone", phone)
												.set("email",
														StrUtil.noHtml(nickname)
																.trim()
																+ "@null.null")
												.set("token", token)
												.set("in_time", date)
												.set("score", 0)
												.set("avatar",
														"/static/img/default_avatar.png")
												.set("type", userType).save();
									}
									removeSessionAttr("unsave_user");
									removeSessionAttr("open_id");
									removeSessionAttr("thirdlogin_type");
								}
								setSessionAttr(Constants.USER_SESSION, user);
								setCookie(Constants.USER_COOKIE,
										StrUtil.getEncryptionToken(user
												.getStr("token")),
										30 * 24 * 60 * 60);
								
								code.set("status", 1).update();
								success(user);
							}
						}
					}
				}
			} else {
				error("请求方式不对，请使用POST");
			}
		} catch (Exception e) {
			e.printStackTrace();
			error("未知错误");
		}
    }


    
    public void sendSMSValiCode() {
        String phone = getPara("phone");
        if (StrUtil.isBlank(phone)) {
            error("手机号不能为空");
        } else if (!StrUtil.isMobile(phone)) {
            error("手机格式不正确");
        } else {
            String type = getPara("type");
            String valicode = StrUtil.randomString(6);

            if (type.equalsIgnoreCase(Constants.FORGET_PWD)) {
                User user = User.me.findByPhone(phone);
                if (user == null) {
                    error("该手机号未被注册，请先注册");
                } else {
                    Valicode code = new Valicode();
                    code.set("code", valicode)
                            .set("type", type)
                            .set("in_time", new Date())
                            .set("status", 0)
                            .set("expire_time", DateUtil.getMinuteAfter(new Date(), 1))
                            .set("target", phone)
                            .save();

                    SMSHelper.messagePost(phone, SMSHelper.contentID_find_password, valicode);

                    success();
                }
            } else if (type.equalsIgnoreCase(Constants.REG)) {
                User user = User.me.findByPhone(phone);
                if (user != null) {
                    error("手机号已经注册，请直接登录");
                } else {
                    Valicode code = new Valicode();
                    code.set("code", valicode)
                            .set("type", type)
                            .set("in_time", new Date())
                            .set("status", 0)
                            .set("expire_time", DateUtil.getMinuteAfter(new Date(), 1))
                            .set("target", phone)
                            .save();
                    SMSHelper.messagePost(phone, SMSHelper.contentID_register, valicode);
                    success();
                }
            }else if(type.equalsIgnoreCase(Constants.SMS_UPDATE_PHONE)){
                
                User user = User.me.findByPhone(phone);
                if (user != null) {
                    error("手机号已经注册，请更换手机号");
                } else {
                    Valicode code = new Valicode();
                    code.set("code", valicode)
                            .set("type", type)
                            .set("in_time", new Date())
                            .set("status", 0)
                            .set("expire_time", DateUtil.getMinuteAfter(new Date(), 1))
                            .set("target", phone)
                            .save();
                    SMSHelper.messagePost(phone, SMSHelper.contentID_common, valicode);
                    success();
                }
            }
        }
    }

    
    public void phonelogin() {
        try {
			String method = getRequest().getMethod();
			if (method.equalsIgnoreCase(Constants.POST)
					|| method.equalsIgnoreCase(Constants.GET)) {
				String phone = getPara("phone");
				String password = getPara("password");
				String userType = getPara("user_type");
				if (StrUtil.isBlank(userType) || StrUtil.isBlank(phone)
						|| StrUtil.isBlank(password)) {
					error("手机号/密码/用户类型都不能为空");
				} else {
					User user = null;
					if ("1".equals(userType)) {
						user = User.me.localStuPhoneLogin(phone,
								HashKit.md5(password), userType);
					} else {
						user = User.me.localPhoneLogin(phone,
								HashKit.md5(password), userType);
					}
					if (user == null) {
						error("手机号/密码/用户类型错误");
					} else {
						Integer schoolId = user.getInt("school_id");
						School school = School.me.getDateAndDayById(schoolId);
						if(!School.me.checkSchoolIsTimeout(school.getDate("start_time"), school.getInt("validity_day"))){
							error("本校时限已到，已关闭登陆功能！");
							return;
						}
						setSessionAttr(Constants.USER_SESSION, user);
						
						
						
						user.set("password", "");
						success(user);
					}
				}
			} else {
				error("请求方式不对，请使用POST");
			}
		} catch (Exception e) {
			e.printStackTrace();
			error("未知错误");
		}
    }

    
    public void phoneforgetpwd() {
        String method = getRequest().getMethod();
        if (method.equalsIgnoreCase(Constants.GET)) {
            render("front/user/phoneforgetpwd.ftl");
        } else if (method.equalsIgnoreCase(Constants.POST)) {
            String phone = getPara("phone");
            String valicode = getPara("valicode");
            String newpwd = getPara("newpwd");
            if (StrUtil.isBlank(phone) || StrUtil.isBlank(valicode) || StrUtil.isBlank(newpwd)) {
                error("请完善信息");
            } else {
                Valicode code = Valicode.me.findByCodeAndPhone(valicode, phone, Constants.FORGET_PWD);
                if (code == null) {
                    error("验证码不存在或已使用(已过期)");
                } else {
                    User user = User.me.findByPhone(phone);
                    if (user == null) {
                        error("该手机号未被注册，请先注册");
                    } else {
                        user.set("password", HashKit.md5(newpwd)).update();
                        code.set("status", 1).update();
                        success(user);
                    }
                }
            }
        }
    }

    
    public void isPhoneExist() {
        String phone = getPara("phone");
        if (StrUtil.isBlank(phone)) {
            error("手机号不能为空");
        } else if (!StrUtil.isMobile(phone)) {
            error("手机格式不正确");
        }
        User user = User.me.findByPhone(phone);
        if (user != null) {
            error("手机号已经注册，请直接登录");
        } else {
            success("手机号不存在，可以注册");
        }
    }

    
    public void isVelicodeRight() {
        String method = getRequest().getMethod();
        if (method.equalsIgnoreCase(Constants.POST)) {
            String phone = getPara("phone");
            String valicode = getPara("valicode");
            if (StrUtil.isBlank(phone) || StrUtil.isBlank(valicode)) {
                error("请完善信息");
            } else {
                Valicode code = Valicode.me.findByCodeAndPhone(valicode, phone, Constants.FORGET_PWD);
                if (code == null) {
                    error("验证码不存在或已使用(已过期)");
                } else {
                    User user = User.me.findByPhone(phone);
                    if (user == null) {
                        error("该手机号未被注册，请先注册");
                    } else {
                        success("验证码通过");
                    }
                }
            }
        } else {
            error("请求方式不对，请使用POST");
        }
    }
    
    
    public void getAllGreetings(){
    	try {
			String clientType = getPara("clientType");
			List<String> types = Greetings.me.getTypesByClientType(clientType);
			List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
			Map<String, Object> map = null;
			for (String str : types) {
				map = new HashMap<String, Object>();
				List<Greetings> greetings = Greetings.me.getAllByClientTypeAndType(clientType, str);
				map.put("type", str);
				map.put("greetings", greetings);
				list.add(map);
			}
			success(list);
			return;
		} catch (Exception e) {
			e.printStackTrace();
		}
    	error("位置错误！");
    	
    }
    
    
    public void getCurrentTime(){
    	Map<String, Object> map = new HashMap<String, Object>();
    	Calendar cal = Calendar.getInstance();
    	map.put("hour", cal.get(Calendar.HOUR_OF_DAY));
    	map.put("timestamp", cal.getTimeInMillis()/1000);
    	success(map);
    }
    
    
    public void checkIsUpdateGreetings(){
    	String type = getPara("type","1");
    	Long time = GreetingsVersion.me.getNewByType(type);
    	success(time);
    }
    
    public void uploadOrUpdateStuResult(){
    	try {
			Integer sid = getParaToInt("sid");
			Integer courseId = getParaToInt("part_id");
			Integer score = getParaToInt("score");
			String playRecord = getPara("play_record");
			String errorFlag = getPara("error_flag");
			Integer jieZou = getParaToInt("s_jieou");
			Integer shiZhi = getParaToInt("s_shizhi");
			Integer yinGao = getParaToInt("s_yingao");
			String comments = getPara("comments");
			Integer id=getParaToInt("id");
			StudentScore stuScore=null;
			if(!StrUtil.checkParamIsNotNull(id)){
				if (!StrUtil.checkParamIsNotNull(sid, courseId, score)) {
					error("part_id、core参数不能为空");
					return;
				}
				stuScore = StudentScore.me.save(sid, courseId, score,
						playRecord, errorFlag, jieZou, shiZhi, yinGao);
				if (stuScore == null) {
					error("保存成绩失败!");
					return;
				}
			}else{
				stuScore = new StudentScore(id, score, jieZou, shiZhi, yinGao,playRecord,errorFlag,comments);
				if(!stuScore.update()){
					error("更新成绩失败!");
					return;
				}
			}
			success(stuScore);
			return;
		} catch (Exception e) {
			e.printStackTrace();
		}
    	error("未知错误");
    }
}
