SELECT * FROM sql_analyze.TB_PBTRNSP;

# 슿하차 구분 코드 별로 인원수가 많은 순으로 역 번호, 역 이름, 호선, 승하차 여부, 승하차 별 합 조회
select STATN_NO, STATN_NM, HO_LN, TKCAR_GFF_SE_CD, sum(NMPR_CNT) as CNT_SUM
from TB_PBTRNSP
where STD_MT ='202304'
group by STATN_NO, STATN_NM, HO_LN, TKCAR_GFF_SE_CD
order by CNT_SUM desc;
# group by에 범주형이 오는건 상관 없다
#reduction ->n개 1개로 대표값

# 승차 및 하차 인원수가 가장 적고, 가장 많은 역 조회
select A.STATN_NO,
	   A.STATN_NM,
       A.HO_LN,
       # 승차인원 컬럼, 하차 인원 컴럼 분리
       CASE WHEN A.TKCAR_GFF_SE_CD ='TK' THEN A.NMPR_CNT else 0 end as TK_NMPR_CNT,
       IF(A.TKCAR_GFF_SE_CD ='GF', A.NMPR_CNT, 0) as GF_NMPR_CNT
from (
	select STATN_NO, 
		   STATN_NM, 
           HO_LN, 
           TKCAR_GFF_SE_CD, 
           sum(NMPR_CNT) as NMPR_CNT
	from TB_PBTRNSP
	group by STATN_NO, STATN_NM, HO_LN, TKCAR_GFF_SE_CD
	order by NMPR_CNT desc
	) as A;



select *
from (
	select A.STATN_NO,
		   A.STATN_NM,
		   A.HO_LN,
		   A.TK_NMPR_CNT,
		   A.GF_NMPR_CNT,
		   ROW_NUMBER() over (order by A.TK_NMPR_CNT) AS RN_TK_NMPR_CNT_ASC,       
		   ROW_NUMBER() over (order by A.TK_NMPR_CNT DESC) AS RN_TK_NMPR_CNT_DESC,
		   ROW_NUMBER() over (order by A.GF_NMPR_CNT) AS RN_GF_NMPR_CNT_ASC,
		   ROW_NUMBER() over (order by A.GF_NMPR_CNT DESC) AS RN_GF_NMPR_CNT_DESC
	from(
		select A.STATN_NO,
			   A.STATN_NM,
			   A.HO_LN,
			   max(A.TK_NMPR_CNT) as TK_NMPR_CNT,
			   max(A.GF_NMPR_CNT) as GF_NMPR_CNT
		from (
			select A.STATN_NO,
			   A.STATN_NM,
			   A.HO_LN,
			   # 승차인원 컬럼, 하차 인원 컴럼 분리
			   CASE WHEN A.TKCAR_GFF_SE_CD ='TK' THEN A.NMPR_CNT else 0 end as TK_NMPR_CNT,
			   IF(A.TKCAR_GFF_SE_CD ='GF', A.NMPR_CNT, 0) as GF_NMPR_CNT
			from (
				select STATN_NO, 
					   STATN_NM, 
					   HO_LN, 
					   TKCAR_GFF_SE_CD, 
					   sum(NMPR_CNT) as NMPR_CNT
				from TB_PBTRNSP
				group by STATN_NO, STATN_NM, HO_LN, TKCAR_GFF_SE_CD
				order by NMPR_CNT desc
				) as A) as A
		group by A.STATN_NO, A.STATN_NM, A.HO_LN
		) as A
    ) as B
where B.RN_TK_NMPR_CNT_ASC =1 OR B.RN_TK_NMPR_CNT_DESC=1 OR B.RN_GF_NMPR_CNT_ASC=1 OR B.RN_GF_NMPR_CNT_DESC=1;

# 출근 시간 대 하차 인원수가 가장 많은 순으로 데이터 조회
select A.STATN_NO, A.STATN_NM, A.HO_LN, SUM(A.NMPR_CNT) AS NMPR_CNT

from TB_PBTRNSP A
where A.STD_MT = '202304'
  AND A.BEGIN_TIME = '1800' AND A.END_TIME ='1900'
  AND A.TKCAR_GFF_SE_CD in ('GF')
group by A.STATN_NO, A.STATN_NM, A.HO_LN
order by NMPR_CNT desc
LIMIT 10;


# 23시 이후 어디서 많이 승차하는지. 지하철이 끊길 가능성이 높으니까 택시를 많이 이용하는 역은?
# 술먹고 지하철 막차 놓칠 가능성이 많은 역
select A.STATN_NO, A.STATN_NM, A.HO_LN, SUM(A.NMPR_CNT) AS NMPR_CNT
from TB_PBTRNSP A
where A.STD_MT = '202304'
  AND (A.BEGIN_TIME, A.END_TIME) IN (('2300', '2400'),
									 ('0000', '0100'),
                                     ('0100', '0200'),
                                     ('0200', '0300'),
                                     ('0300', '0400'))
  AND A.TKCAR_GFF_SE_CD ='TK'
group by A.STATN_NO, A.STATN_NM, A.HO_LN
order by NMPR_CNT desc
LIMIT 10;


# 각 호선 별 승하차 인원수가 가장 많은 역을 골라보자!!

SELECT * FROM sql_analyze.TB_PBTRNSP;
select *
from (
	select STATN_NO, 
			STATN_NM, 
			HO_LN,
			sum(NMPR_CNT) as NMPR_CNT,
			ROW_NUMBER() over (PARTITION BY HO_LN order by sum(NMPR_CNT) desc) AS RN_TK_NMPR_CNT_desc 
		from TB_PBTRNSP
		group by STATN_NO, STATN_NM, HO_LN
		order by NMPR_CNT desc
	) as A
where A.RN_TK_NMPR_CNT_desc=1;
