package com.bluemobi.po.groupon;

import java.util.Date;

import com.appcore.model.AbstractObject;

/**
 * 【团购表】持久化对象 数据库表：groupon_bulk
 * 
 * @author AutoCode 309444359@qq.com
 * @date 2015-10-20 16:51:17
 * 
 */
public class GrouponBulk extends AbstractObject {

    public static final long serialVersionUID = 1L;

    //
    private Integer bulkId;
    // 团购名称
    private String title;
    // 分类 ID 多个以 , 分隔
    private String categoryId;
    // N件起团，N件生效
    private Integer number;
    // 团购开始时间
    private Date startTime;
    // 团购结束时间
    private Date endTime;
    // 团购总库存
    private Integer inventorySum;
    // 库存准量：每一次下单减去购买个数
    private Integer inventory;
    // 团购价格
    private Float price;
    // 商品 sku
    private String sku;
    // 商品名称
    private String goodsName;
    // 可否使用积分，0代表不可使用积分
    private Integer integral;
    // 创建时间
    private Date ctime;

    /** 获取 属性 */
    public Integer getBulkId() {
        return bulkId;
    }

    /** 设置 属性 */
    public void setBulkId(Integer bulkId) {
        this.bulkId = bulkId;
    }

    /** 获取 团购名称 属性 */
    public String getTitle() {
        return title;
    }

    /** 设置 团购名称 属性 */
    public void setTitle(String title) {
        this.title = title;
    }

    /** 获取 分类 ID 多个以 , 分隔 属性 */
    public String getCategoryId() {
        return categoryId;
    }

    /** 设置 分类 ID 多个以 , 分隔 属性 */
    public void setCategoryId(String categoryId) {
        this.categoryId = categoryId;
    }

    /** 获取 N件起团，N件生效 属性 */
    public Integer getNumber() {
        return number;
    }

    /** 设置 N件起团，N件生效 属性 */
    public void setNumber(Integer number) {
        this.number = number;
    }

    /** 获取 团购开始时间 属性 */
    public Date getStartTime() {
        return startTime;
    }

    /** 设置 团购开始时间 属性 */
    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    /** 获取 团购结束时间 属性 */
    public Date getEndTime() {
        return endTime;
    }

    /** 设置 团购结束时间 属性 */
    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    /** 获取 团购总库存 属性 */
    public Integer getInventorySum() {
        return inventorySum;
    }

    /** 设置 团购总库存 属性 */
    public void setInventorySum(Integer inventorySum) {
        this.inventorySum = inventorySum;
    }

    /** 获取 库存准量：每一次下单减去购买个数 属性 */
    public Integer getInventory() {
        return inventory;
    }

    /** 设置 库存准量：每一次下单减去购买个数 属性 */
    public void setInventory(Integer inventory) {
        this.inventory = inventory;
    }

    /** 获取 团购价格 属性 */
    public Float getPrice() {
        return price;
    }

    /** 设置 团购价格 属性 */
    public void setPrice(Float price) {
        this.price = price;
    }

    /** 获取 商品 sku 属性 */
    public String getSku() {
        return sku;
    }

    /** 设置 商品 sku 属性 */
    public void setSku(String sku) {
        this.sku = sku;
    }

    /** 获取 商品名称 属性 */
    public String getGoodsName() {
        return goodsName;
    }

    /** 设置 商品名称 属性 */
    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    /** 获取 可否使用积分，0代表不可使用积分 属性 */
    public Integer getIntegral() {
        return integral;
    }

    /** 设置 可否使用积分，0代表不可使用积分 属性 */
    public void setIntegral(Integer integral) {
        this.integral = integral;
    }

    /** 获取 创建时间 属性 */
    public Date getCtime() {
        return ctime;
    }

    /** 设置 创建时间 属性 */
    public void setCtime(Date ctime) {
        this.ctime = ctime;
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder();
        sb.append("GrouponBulk");
        sb.append("{bulkId=").append(bulkId);
        sb.append(", title=").append(title);
        sb.append(", categoryId=").append(categoryId);
        sb.append(", number=").append(number);
        sb.append(", startTime=").append(startTime);
        sb.append(", endTime=").append(endTime);
        sb.append(", inventorySum=").append(inventorySum);
        sb.append(", inventory=").append(inventory);
        sb.append(", price=").append(price);
        sb.append(", sku=").append(sku);
        sb.append(", goodsName=").append(goodsName);
        sb.append(", integral=").append(integral);
        sb.append(", ctime=").append(ctime);
        sb.append('}');
        return sb.toString();
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof GrouponBulk) {
            GrouponBulk grouponBulk = (GrouponBulk) obj;
            if (this.getBulkId().equals(grouponBulk.getBulkId())) {
                return true;
            }
        }
        return false;
    }

    public int hashCode() {
        String pkStr = "" + this.getBulkId();
        return pkStr.hashCode();
    }

}