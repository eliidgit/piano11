package com.jfinalshiromh.module.course.coursepart.po;

import com.jfinalshiromh.module.course.Course;
import com.jfinalshiromh.module.course.coursepart.Coursepart;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;



public class TreeViewNode  {


    private String id;
    private String pid;
    private String text;
    private String href;

    private Boolean  isParent;
    private Map<String, Object> attributes = new HashMap<String, Object>();
    public static TreeViewNode me = new TreeViewNode();
    public TreeViewNode() {
    }

    public Map<String, Object> getAttributes() {
        return attributes;
    }

    public void setAttributes(Map<String, Object> attributes) {
        this.attributes = attributes;
    }


    public Boolean getIsParent() {
        return isParent;
    }

    public void setIsParent(Boolean isParent) {
        this.isParent = isParent;
    }
    
    private List<TreeViewNode> nodes;
    private String[]  tags;

    public String getId(){return  id;}
    public void setId(String Id){this.id=Id;}
    public String getPid(){return  pid;}
    public void setPid(String pid){this.pid=pid;}
    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getHref() {
        return href;
    }

    public void setHref(String href) {
        this.href = href;
    }

    public List<TreeViewNode> getNodes() {
        return nodes;
    }

    public void setNodes(List<TreeViewNode> nodes) {
        this.nodes = nodes;
    }



    public String[] getTags() {
        return tags;
    }

    public void setTags(String[] tags) {
        this.tags = tags;
    }
/*

    public  List<TreeViewNode> getRoot() throws Exception {
        List<TreeViewNode> treeList = new ArrayList<TreeViewNode>();

        List<Course> list = Course.me.list();
        for(Course course : list){
            TreeViewNode courseNode = new TreeViewNode();
            courseNode.setId(course.getInt("id")+"");
            courseNode.setPid("0");
            courseNode.setText(course.getStr("name"));
            courseNode.setHref("/admin/coursepart/?courseId=" + course.getInt("id"));
            courseNode.setIsParent(true);
            treeList.add(courseNode);
        }

        return treeList;
    }
*/

/*
    public List getNextNodes(int pid) throws Exception{

        List<Coursepart> firstChannelList = Coursepart.me.getChildsById(pid);
        
        List<TreeViewNode> partViewList = new ArrayList<TreeViewNode>();

        for(Coursepart course : firstChannelList) {
            TreeViewNode courseNode = new TreeViewNode();
            courseNode.setId(course.getStr("id") + "");
            courseNode.setPid(course.getStr("parent_id") + "");
            courseNode.setText(course.getStr("name") + "");
            courseNode.setHref("/admin/coursepart/?coursepart=" + course.getStr("id"));
            if(pid>0){
                courseNode.setIsParent(false);
            }else {courseNode.setIsParent(true);}
            partViewList.add(courseNode);
        }
        return partViewList;
    }*/

}
