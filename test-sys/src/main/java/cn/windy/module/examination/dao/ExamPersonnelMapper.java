package cn.windy.module.examination.dao;

import cn.windy.module.examination.mybatis.model.ExamPersonnel;
import cn.windy.module.examination.mybatis.model.ExamPersonnelQuery;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface ExamPersonnelMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table exam_personnel
     *
     * @mbggenerated
     */
    int countByExample(ExamPersonnelQuery example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table exam_personnel
     *
     * @mbggenerated
     */
    int deleteByExample(ExamPersonnelQuery example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table exam_personnel
     *
     * @mbggenerated
     */
    @Delete({
        "delete from exam_personnel",
        "where id = #{id,jdbcType=BIGINT}"
    })
    int deleteByPrimaryKey(Long id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table exam_personnel
     *
     * @mbggenerated
     */
    @Insert({
        "insert into exam_personnel (id, exam_id, ",
        "user_id, creat_id, is_exam, ",
        "is_count, attr0, ",
        "attr1, attr2, attr3, ",
        "attr4, attr5, attr6, ",
        "attr7, attr8, attr9)",
        "values (#{id,jdbcType=BIGINT}, #{examId,jdbcType=BIGINT}, ",
        "#{userId,jdbcType=BIGINT}, #{creatId,jdbcType=BIGINT}, #{isExam,jdbcType=INTEGER}, ",
        "#{isCount,jdbcType=INTEGER}, #{attr0,jdbcType=VARCHAR}, ",
        "#{attr1,jdbcType=VARCHAR}, #{attr2,jdbcType=VARCHAR}, #{attr3,jdbcType=VARCHAR}, ",
        "#{attr4,jdbcType=VARCHAR}, #{attr5,jdbcType=VARCHAR}, #{attr6,jdbcType=INTEGER}, ",
        "#{attr7,jdbcType=INTEGER}, #{attr8,jdbcType=BIGINT}, #{attr9,jdbcType=BIGINT})"
    })
    int insert(ExamPersonnel record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table exam_personnel
     *
     * @mbggenerated
     */
    int insertSelective(ExamPersonnel record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table exam_personnel
     *
     * @mbggenerated
     */
    List<ExamPersonnel> selectByExample(ExamPersonnelQuery example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table exam_personnel
     *
     * @mbggenerated
     */
    @Select({
        "select",
        "id, exam_id, user_id, creat_id, is_exam, is_count, attr0, attr1, attr2, attr3, ",
        "attr4, attr5, attr6, attr7, attr8, attr9",
        "from exam_personnel",
        "where id = #{id,jdbcType=BIGINT}"
    })
    @ResultMap("BaseResultMap")
    ExamPersonnel selectByPrimaryKey(Long id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table exam_personnel
     *
     * @mbggenerated
     */
    int updateByExampleSelective(@Param("record") ExamPersonnel record, @Param("example") ExamPersonnelQuery example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table exam_personnel
     *
     * @mbggenerated
     */
    int updateByExample(@Param("record") ExamPersonnel record, @Param("example") ExamPersonnelQuery example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table exam_personnel
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(ExamPersonnel record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table exam_personnel
     *
     * @mbggenerated
     */
    @Update({
        "update exam_personnel",
        "set exam_id = #{examId,jdbcType=BIGINT},",
          "user_id = #{userId,jdbcType=BIGINT},",
          "creat_id = #{creatId,jdbcType=BIGINT},",
          "is_exam = #{isExam,jdbcType=INTEGER},",
          "is_count = #{isCount,jdbcType=INTEGER},",
          "attr0 = #{attr0,jdbcType=VARCHAR},",
          "attr1 = #{attr1,jdbcType=VARCHAR},",
          "attr2 = #{attr2,jdbcType=VARCHAR},",
          "attr3 = #{attr3,jdbcType=VARCHAR},",
          "attr4 = #{attr4,jdbcType=VARCHAR},",
          "attr5 = #{attr5,jdbcType=VARCHAR},",
          "attr6 = #{attr6,jdbcType=INTEGER},",
          "attr7 = #{attr7,jdbcType=INTEGER},",
          "attr8 = #{attr8,jdbcType=BIGINT},",
          "attr9 = #{attr9,jdbcType=BIGINT}",
        "where id = #{id,jdbcType=BIGINT}"
    })
    int updateByPrimaryKey(ExamPersonnel record);

    int DeleteUncheckedExamUserId(@Param("examId") Long examId,@Param("list")List<String> list);

    List<ExamPersonnel> findByListByExamIdAndUserId(@Param("examId")Long examId,@Param("userId")Long userId);


    void deleteExamFrontUser(@Param("examId")Long examId);

}