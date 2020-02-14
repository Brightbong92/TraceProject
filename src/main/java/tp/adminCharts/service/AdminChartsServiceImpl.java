package tp.adminCharts.service;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import tp.adminCharts.mapper.AdminChartsMapper;

@Log4j
@AllArgsConstructor
@Service
public class AdminChartsServiceImpl implements AdminChartsService{
	private AdminChartsMapper adminchartsMapper;
	
	@Override
	public int countmem1() {
		return adminchartsMapper.chartCount1();
		 
	}

	@Override
	public int countmem2() {
		return adminchartsMapper.chartCount2();
	}

	@Override
	public int countmem3() {
		return adminchartsMapper.chartCount3();
	}

	@Override
	public int countmem4() {
		return adminchartsMapper.chartCount4();
	}

	@Override
	public int countmem5() {
		return adminchartsMapper.chartCount5();
	}

	@Override
	public int countmem6() {
		return adminchartsMapper.chartCount6();
	}

	@Override
	public int countmem7() {
		return adminchartsMapper.chartCount7();
	}

	@Override
	public int womenCount() {
		return adminchartsMapper.womenCount();
	}

	@Override
	public int menCount() {
		return adminchartsMapper.menCount();
	}

	@Override
	public int sportMTRCG() {
		return adminchartsMapper.sportMTRCG();
	}

	@Override
	public int musicMTRCG() {
		return adminchartsMapper.musicMTRCG();
	}

	@Override
	public int craftsMTRCG() {
		return adminchartsMapper.craftsMTRCG();
	}

	@Override
	public int cookMTRCG() {
		return adminchartsMapper.cookMTRCG();
	}

	@Override
	public int pictureMTRCG() {
		return adminchartsMapper.pictureMTRCG();
	}

	@Override
	public int beautyMTRCG() {
		return adminchartsMapper.beautyMTRCG();
	}

	@Override
	public int bevMTRCG() {
		return adminchartsMapper.bevMTRCG();
	}

	@Override
	public int memberCount() {
		return adminchartsMapper.memberCount();
	}

	@Override
	public int mentoringCount() {
		return adminchartsMapper.mentoringCount();
	}

	@Override
	public int mentoCount() {
		return adminchartsMapper.mentoCount();
	}

	@Override
	public int memAge1519() {
		return adminchartsMapper.memAge1519();
	}

	@Override
	public int memAge2029() {
		return adminchartsMapper.memAge2029();
	}

	@Override
	public int memAge3039() {
		return adminchartsMapper.memAge3039();
	}

	@Override
	public int memAge4049() {
		return adminchartsMapper.memAge4049();
	}

	@Override
	public int memAge5059() {
		return adminchartsMapper.memAge5059();
	}

	@Override
	public int memAge6069() {
		return adminchartsMapper.memAge6069();
	}

	@Override
	public int memAge7079() {
		return adminchartsMapper.memAge7079();
	}

	@Override
	public int memAge8089() {
		return adminchartsMapper.memAge8089();
	}

	@Override
	public int memAge9099() {
		return adminchartsMapper.memAge9099();
	}

	@Override
	public int dis_reson1() {
		return adminchartsMapper.dis_reson1();
	}

	@Override
	public int dis_reson2() {
		return adminchartsMapper.dis_reson2();
	}

	@Override
	public int dis_reson3() {
		return adminchartsMapper.dis_reson3();
	}

	@Override
	public int dis_reson4() {
		return adminchartsMapper.dis_reson4();
	}

	@Override
	public int dis_reson5() {
		return adminchartsMapper.dis_reson5();
	}

	@Override
	public int dis_reson6() {
		return adminchartsMapper.dis_reson6();
	}

	@Override
	public int reviewList() {
		 
		return adminchartsMapper.reviewList();
	}

}
