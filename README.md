# brotato_shakerrato_mod

** 개발 목적으로 운영되는 repo로, origin source가 모두 포함 된 repository입니다. 이에 비공개 운영 됩니다.
** 차후 공개용 repo는 별도로 open 예정 입니다.

## branch 정책

- master branch는 publishing/version control 대상 branch 입니다.
- 개발 branch는 별도 naming을 하여 운영 됩니다.
- 현재 개발 대상 branch 이름은 "ex" 입니다.

### checkout 방법
```bash
git checkout ex
````

## endless elite 난이도 수정

###elite 수 조정
- res://mods-unpacked/shakerrato-InfiniteElites/extensions/singletons/run_data.gd

###elite hp 조정
- res://mods-unpacked/shakerrato-InfiniteElites/extensions/entities/units/enemies/enemy.gd

## Item 수정

이하 모든 내용들은 아래 파일 내용에 해당 됩니다.
res://mods-unpacked/shakerrato-InfiniteElites/extensions/content_editor.gd

기본적으로 아래에 사용되는 수정 방법들은,
대상 서치 -> 대상 수정 과정을 거치게 되며,
대상 서치 시, 아이템의 Name property를 사용합니다.

![image](https://user-images.githubusercontent.com/112671009/230756314-58a56680-4eaf-41f6-b2cd-db07eb287048.png)


### edit_items()
- 일반 아이템을 수정하는 code들을 이곳에 작성 합니다.
- 대체적으로, 일반적인 아이템들의 수정 대상 값들은 effects에 포함되어 있습니다.

### edit_weapons()
- 무기를 수정하는 code들을 이곳에 작성 합니다.
- 대상 무기를 찾을 때, 무기 Tier parameter를 추가하여 정확한 대상 아이템을 검색합니다. (예제 참조)
- 대체적으로, 일반적인 무기 아이템들의 수정 대상 값들은 stats에 포함되어 있습니다.

### remove_weapons()
- 일반 아이템을 변경하는 code들을 이곳에 작성 합니다.
- remove_weapon() method 내에서 캐릭터들의 시작 무기 또한 함께 제거 해 주므로, 아이템 이름만 전달 해 넣어 주시면 됩니다.
