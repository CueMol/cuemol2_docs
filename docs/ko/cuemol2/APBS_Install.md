[문서](../Documents)
## APBS 및 PDB2PQR 설치 가이드 (APBS & PDB2PQR Setup)

CueMol2에서 정전기 전위 맵을 계산하기 위해 필요한 외부 도구인 **APBS (Adaptive Poisson-Boltzmann Solver)** 및 **PDB2PQR**의 설치 방법입니다.

---

### Windows 환경
* CueMol 2.1.0 이상의 공식 Windows 설치 프로그램을 통해 설치한 경우, **APBS 및 PDB2PQR 실행 환경이 기본적으로 함께 포함**되어 설치됩니다. 별도의 수동 설치 작업 없이 즉시 사용할 수 있습니다.
* 설치 경로: `C:\Program Files (x86)\CueMol 2.0\apbs\APBS.exe` 및 `pdb2pqr_wrap.bat`

---

### macOS 환경
* CueMol 2.2.3.434 이상의 최신 macOS 배포판에는 APBS와 PDB2PQR이 기본 번들되어 제공됩니다.

#### 수동 설치가 필요한 경우:
1. **APBS 다운로드**: [APBS SourceForge 릴리스](https://sourceforge.net/projects/apbs/files/apbs/)에서 macOS 바이너리(`APBS-X.X.X-binary.dmg`)를 다운로드하여 `/Applications` 폴더에 설치합니다.
2. **PDB2PQR 다운로드**: [PDB2PQR SourceForge](https://sourceforge.net/projects/pdb2pqr/files/pdb2pqr/)에서 macOS 바이너리(`pdb2pqr-osx-bin-X.X.X.tar.gz`)를 다운로드하여 압축을 푼 뒤 `/Applications` 폴더에 배치합니다.

---

### 설치 후 다음 단계
설치가 완료되었거나 기본 내장 버전을 사용하는 경우, [APBS 정전기 전위 계산 및 표면 매핑 가이드](./APBS_ElePot)로 이동하여 계산을 진행하세요.
