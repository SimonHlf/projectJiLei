package cn.windy.util;

public class Pagination {

    private int page = 1;
    private int pageSize = 10;
    private long total = 1;
    private long pageTotal = 1;

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getPageSize() {
        return pageSize;
    }

    public long getTotal() {
        return total;
    }

    public void setTotal(long total) {
        this.total = total;
        setPageTotal((total+pageSize-1)/pageSize);
    }

    public long getPageTotal() {
        return pageTotal;
    }

    public void setPageTotal(long pageTotal) {
        this.pageTotal = pageTotal;
    }

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
    
}
