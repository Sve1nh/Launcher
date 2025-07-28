print("Hello world!");
val script = [
    "malum:processed_soulstone",
    "malum:raw_soulstone",
    "malum:spirit_altar",
    "malum:soul_stained_steel_ingot",
    "malum:encyclopedia_arcana",
    "minecraft:torch",
    "minecraft:soul_torch",
    "create:andesite_alloy"
];

for itemName in script {
    val item = <item:${itemName}>;
    item.addTooltip("Предмет недоступен для создания");
    recipes.remove(item);
}