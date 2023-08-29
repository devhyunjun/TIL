# Github 프로필 꾸미기
자신의 github 계정이랑 일치하는 repository 형성
설정 : private, README.md 수정
	

## 6. clone, pull, push
6.1- clone
원격 저장소 -> 로컬 저장소
```bash
git clone <원격저장소 주소>
```
- 해당 작업 수행 시 git init, git remote add 이미 실행되어있음
  
6.2- pull
```bash
git pull <원격저장소 주소> <브랜치 이름>
```

6.3- push
git push origin <브랜치이름>


## 7. .gitignore
- ! itit 하기전! 
- 하는 이유 : 습관적으로 add . 하기 쉽기 때문에 해당 폴더에 공유하면 안되는 거는 미리 파일 만들어서 gitignore에 넣어놔야한다.
- git
- 참고사이트 [gitignore.io](https://www.toptal.com/developers/gitignore/)


## 8. Branch
- 원본 가지고 만지다가 잘못하면 다 날리고, 여러 사람이랑 협업하면 기존에 있는 서비스 가지고 여러 기능 동시에 개발하려면 master는 건드리지 말아야한다.

- branch 만들어서 작업하고 그것을 같이 검토한 다음 merge하는 방식으로 작업

## 9.branch merge
<유의사항>
- head를 기준으로 branch를 생성 또는 병합.
- 병합할 때는 master로 switch한 후 다른 branch를 병합 -> master가 기준



- 알게 된 용어
git log 확인 - 한 줄로, 여러 브런치 내용, 그래프로
git log --oneline --all --graph

원격 저장소의 브랜치 목록 확인
git branch -r
 
새로운 브랜치 생성
$ git branch <브랜치 이름>

특정 커밋 기준으로 브랜치 생성
$ git branch <브랜치 이름> <커밋 ID>

특정 브랜치 삭제
$ git branch -d <브랜치 이름> # 병합된 브랜치만 삭제 가능

브랜치를 새로 생성과 동시에 이동
$ git switch -c <브랜치 이름>