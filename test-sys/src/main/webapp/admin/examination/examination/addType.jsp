<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="widget model_widget">
    <div class="">
        <div id="horizontal-form">
            <form class="form-horizontal" method="post" id="addExaminationForm">
                <div >
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">考试类型</label>
                        <div class="col-sm-9">
                            <select id="examType">
                                <option value="1">考试</option>
                                <option value="0">练习</option>
                            </select>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>