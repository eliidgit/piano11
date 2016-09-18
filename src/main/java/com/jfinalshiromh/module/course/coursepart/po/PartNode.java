package com.jfinalshiromh.module.course.coursepart.po;

import com.jfinalshiromh.module.course.coursepart.Coursepart;

import java.util.List;



public class PartNode {
    
    private Coursepart part;
    
    private List<PartNode> nodes;


    public Coursepart getPart() {
        return part;
    }

    public void setPart(Coursepart part) {
        this.part = part;
    }

    public List<PartNode> getNodes() {
        return nodes;
    }

    public void setNodes(List<PartNode> nodes) {
        this.nodes = nodes;
    }
}
