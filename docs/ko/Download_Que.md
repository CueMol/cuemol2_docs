## 구버전 다운로드 (Que)
### 안정화 릴리스 (build 20040311)

|OS|파일 종류|링크|비고|
|---|---|---|---|
|Windows|실행 파일, DLL 및 데이터 파일 (zip 압축)|[HTTP](http://cuemol.sourceforge.jp/misc/que-download/Que-20040311.zip)|위 실행 파일에는 프로그램 실행에 필요한 여러 DLL 파일(msvcr71.dll, msvcp71.dll, mfc71.dll)이 포함되어 있습니다. 이 DLL 파일들을 Que.exe 파일이 설치된 동일 디렉터리에 배치해 주세요. 이전 릴리스에서 별도 파일로 배포되었던 데이터 파일이 동일한 파일에 포함되어 있습니다. 기타 설치 절차는 이전 버전과 동일합니다.|
|MacOSX (10.3)|실행 파일 및 데이터 파일 (tar.gz 압축)|[HTTP](http://cuemol.sourceforge.jp/misc/que-download/Que-osx10.3-20040325.tar.gz)|OSX 바이너리 릴리스는 fink를 통해 설치된 다음 라이브러리에 동적 연결되어 있습니다: **db4**, **gdbm**, **readline**<br/>fink를 설치한 후 fink의 "apt-get"으로 위 라이브러리를 설치해 주세요. 이 실행 파일들은 "--prefix=/usr/local" 플래그로 컴파일되었으므로 "/usr/local"에서 압축을 푸는 것을 권장합니다 (예: `cd /usr/local; tar xzvf XXXX.tar.gz`).<br/>bin 디렉터리의 "quex"는 X11R6 버전이고 "quetty"는 TTY 버전입니다. (실행 전에 Apple 사이트에서 X11을 설치해야 합니다.)|
