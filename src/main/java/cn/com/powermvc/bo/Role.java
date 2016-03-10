package cn.com.powermvc.bo;


import org.apache.ibatis.type.Alias;

@Alias("Role")
public class Role  extends BaseEntity  {

    private String name;

    private String description;

    private Long sindex;

    
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    
    public Long getSindex() {
        return sindex;
    }

    public void setSindex(Long sindex) {
        this.sindex = sindex;
    }

}