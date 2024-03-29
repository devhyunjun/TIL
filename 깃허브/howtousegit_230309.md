# 새로 배운 용어

홈 디렉토리 : ~ 틸드
<br>touch : 파일생성
<br>ls : 현재작업중인 <br>파일목록 (-l 파일정보상세)
<br>cd .. 부모디렉토리
<br> ctrl + l : 터미널 화면 청소
<br> ctrl + insert : 복사
<br> shift + insert : 붙여넣기
<br>d
<br>ctrl + `(backtick, 백틱)
<br> \```python\```
<br> 링크 : [표시할 글자](이동할 주소)
<br> 이미지 : ![대체 텍스트](이미지 주소)
<br> 인용 >

# git

1. git 초기설정

```bash
$ git config --global user.name "이름"
$ git config --global user.email "메일 주소"
$ git config --global -l
```

2. git add
   특정 파일
   $ git add a.txt

3. 특정 폴더
   $ git add my_folder/

4. 현재 디렉토리에 속한 파일/폴더 전부
   $ git add .

## git 저장소 연결

1. 로컬 저장소 만들기, 파일 커밋
   <br>`git init`

- 주의할 점 상위폴더에 만들면 전체가 다 git에 올라감
- 파일업로드 <br>`git add day1.md`
- 파일 커밋 <br>`git commit -m "파일"`
- 커밋 여부 확인 <br>`git log --oneline`
  <br>
  <br>

2. 원격 저장소 연결

- 등록 <br>`git remote add origin "주소"`
- 조회 <br>`git remote -v`
- 삭제 <br>`git remote rm origin`
  <br>
  <br>

3. 원격 저장소 업로드

- 푸쉬 <br>`git push origin master
