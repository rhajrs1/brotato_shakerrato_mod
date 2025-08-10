## Branch Policy

- The master branch is used for publishing and version control.
- All development is done on separate branches with descriptive names.
- The current active development branch is called ex.

### How to Checkout
```bash
git fetch --all
git checkout ex
````

- If you encounter issues due to local changes preventing the above commands from working, you can clean up your local repository with the following commands
(Warning: This will roll back all local changes!)
```bash
git reset --hard
git clean -df
````

## Modifying the "Endless Elite" Difficulty

### Adjust the number of elites
- res://mods-unpacked/shakerrato-InfiniteElites/extensions/singletons/run_data.gd

### Adjust elite HP
- res://mods-unpacked/shakerrato-InfiniteElites/extensions/entities/units/enemies/enemy.gd

## Update Items

All instructions below refer to editing the following file:
res://mods-unpacked/shakerrato-InfiniteElites/extensions/content_editor.gd

In general, modifications involve two steps: searching for the target (by the item's Name property) and then editing the target.

![image](https://user-images.githubusercontent.com/112671009/230756314-58a56680-4eaf-41f6-b2cd-db07eb287048.png)


### edit_items()
- Add code to modify regular items here.
- Most values to be changed for typical items can be found in the effects property.

### edit_weapons()
- Add code to modify weapons here.
- When searching for a target weapon, use the Tier parameter for precise selection. (See example in code.)
- Most values to be changed for typical weapons can be found in the stats property.

### remove_weapons()
- Add code here to remove regular weapon items.
- The remove_weapon() method will also remove starting weapons for characters if you simply pass the item name.
