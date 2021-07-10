package com.reservation.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.evaluation.domain.EvaluationDTO;
import com.reservation.domain.MemberOrderListDTO;
import com.reservation.domain.ReservationDTO;

@Repository
public class ReservationDaoImpl implements ReservationDAO {
    @Autowired
    public SqlSession sqlSession;

    @Override
    public void reservate(ReservationDTO reservation) throws DataAccessException {
        sqlSession.insert("reservate", reservation);
    }

	@Override
	public List<MemberOrderListDTO> getMemberOrders(String member_id) {
		return sqlSession.selectList("getMemberOrders",member_id);
	}

	@Override
	public int getOrderNum(String member_id) {
		return sqlSession.selectOne("getOrderNum",member_id);
	}
	
	@Override
	public void orderCancel(String reser_number) {
		 sqlSession.update("orderCancel", reser_number);
	}

	@Override
	public void orderUsed() {
		sqlSession.update("orderUsed");
	}
	
	@Override
	public List<MemberOrderListDTO> orderEvaluationList(String member_id) {
		return sqlSession.selectList("orderEvaluationList",member_id);
	}

	@Override
	public int orderEvaluationNum(String member_id) {
		return sqlSession.selectOne("orderEvaluationNum",member_id);
	}

	@Override
	public MemberOrderListDTO getOrderOneByReser_number(int reser_number) {
		return sqlSession.selectOne("getOrderOneByReser_number",reser_number);
	}

	@Override
	public List<MemberOrderListDTO> getCafeOrders(String cafe_id) {
		return sqlSession.selectList("getCafeOrders",cafe_id);
	}

	@Override
	public List<MemberOrderListDTO> getCafeOrdersUsed(String cafe_id) {
		return sqlSession.selectList("getCafeOrdersUsed",cafe_id);
	}

	@Override
	public EvaluationDTO getEvaluationOneByReser_number(int reser_number) {
		return sqlSession.selectOne("getEvaluationOneByReser_number",reser_number);
	}

	

}
