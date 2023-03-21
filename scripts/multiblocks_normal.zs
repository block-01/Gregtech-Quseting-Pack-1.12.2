#packmode normal

import mods.gregtech.multiblock.Builder;
import mods.gregtech.multiblock.FactoryBlockPattern;
import mods.gregtech.multiblock.RelativeDirection;
import mods.gregtech.multiblock.functions.IPatternBuilderFunction;
import mods.gregtech.IControllerTile;
import mods.gregtech.multiblock.CTPredicate;
import mods.gregtech.multiblock.IBlockPattern;
import mods.gregtech.recipe.FactoryRecipeMap;
import mods.gregtech.recipe.RecipeMap;
import mods.gregtech.recipe.functions.IRunOverclockingLogicFunction;
import mods.gregtech.recipe.IRecipeLogic;
import mods.gregtech.recipe.IRecipe;

import scripts.common.makeShaped as makeShaped;
import scripts.common.absolute_int as absolute_int;

//val ROCKET_ARROW as ITextureArea = ITextureArea.fullImage("multiblocktweaker:textures/gui/progress_bar/rocket.png");

// multiblock stuctures


// Creative Tank Provider
val creative_tank_provider = Builder.start("mbt:creative_tank_provider")
    .withPattern(function(controller as IControllerTile) as IBlockPattern {
        return FactoryBlockPattern.start()
            .aisle("CCC", "CCC", "CCC")
            .aisle("CCC", "CFC", "CCC")
            .aisle("CCC", "CSC", "CCC")
            .where('S', controller.self())
            .where('F', <metastate:gregtech:meta_block_frame_24:12>) // Tungstencarbide Frame Box
            .where("C", CTPredicate.states(<metastate:gcym:large_multiblock_casing:11>).setMinGlobalLimited(15) | controller.autoAbilities(true, false, true, true, false, false, false))
            .build();
    } as IPatternBuilderFunction)
    .withRecipeMap(
        FactoryRecipeMap.start("creative_tank_provider")
            .minInputs(2)
            .maxInputs(2)
            .minOutputs(1)
            .maxOutputs(1)
            .build())
    .withBaseTexture(<metastate:gcym:large_multiblock_casing:11>)
    .buildAndRegister();

creative_tank_provider.hasMufflerMechanics = false;
creative_tank_provider.hasMaintenanceMechanics = false;



// Naquadah Reactor 1
<gcym:large_multiblock_casing:9>.displayName = "Reaction-Safe Casing";
val naquadah_reactor_1 = Builder.start("naquadah_reactor_1")
    .withPattern(function(controller as IControllerTile) as IBlockPattern {
        return FactoryBlockPattern.start()
            .aisle(
                "CCC",
                "PGP",
                "PGP",
                "PGP",
                "CCC"
            )
            .aisle(
                "CCC",
                "GNG",
                "GNG",
                "GOG",
                "CCC"
            )
            .aisle(
                "CSC",
                "PGP",
                "PGP",
                "PGP",
                "CCC"
            )
            .where('S', controller.self())
            .where('G', <metastate:gregtech:transparent_casing:1>)
            .where('P', <blockstate:appliedenergistics2:spatial_pylon>)
            .where('O', <metastate:extendedcrafting:trimmed:5>)
            .where('N', <metastate:gregtech:meta_block_compressed_8:1>)
            .where('C', CTPredicate.states(<metastate:gcym:large_multiblock_casing:9>)
            | CTPredicate.abilities(<mte_ability:IMPORT_ITEMS>).setMinGlobalLimited(1).setPreviewCount(1)
            | CTPredicate.abilities(<mte_ability:EXPORT_ITEMS>).setMinGlobalLimited(1).setPreviewCount(1)
            | CTPredicate.abilities(<mte_ability:OUTPUT_ENERGY>).setMinGlobalLimited(1).setMaxGlobalLimited(3).setPreviewCount(1)
            )
            .build();
        } as IPatternBuilderFunction)
    .withRecipeMap(
        FactoryRecipeMap.start("naquadah_reactor_1")
            .minInputs(1)
            .maxInputs(1)
            .minOutputs(1)
            .maxOutputs(1)
            .build())
    .withBaseTexture(<metastate:gcym:large_multiblock_casing:9>)
    .buildAndRegister();
naquadah_reactor_1.hasMufflerMechanics = false;
naquadah_reactor_1.hasMaintenanceMechanics = false;
//naquadah_reactor_1.frontOverlay = <cube_renderer:CANNER_OVERLAY>;

naquadah_reactor_1.runOverclockingLogic = function(recipelogic as IRecipeLogic, recipe as IRecipe, negativeEU as bool, maxOverclocks as int) as int[] {
    return IRecipeLogic.standardOverclockingLogic(recipe.getEUt() * (negativeEU ? -1 : 1), recipelogic.maxVoltage, recipe.getDuration(), 1, 1, 0); // 1x duration, 1x voltage, 0 overclocks
} as IRunOverclockingLogicFunction;

<metaitem:multiblocktweaker:naquadah_reactor_1>.addTooltip(format.yellow("Produces exactly 3A ZPM, does not overclock"));

// Naquadah Reactor 2
val naquadah_reactor_2 = Builder.start("naquadah_reactor_2")
    .withPattern(function(controller as IControllerTile) as IBlockPattern {
        return FactoryBlockPattern.start()
            .aisle(
                "CCC",
                "PGP",
                "PGP",
                "PGP",
                "PGP",
                "CCC"
            )
            .aisle(
                "CCC",
                "GNG",
                "GNG",
                "GNG",
                "GOG",
                "CCC"
            )
            .aisle(
                "CSC",
                "PGP",
                "PGP",
                "PGP",
                "PGP",
                "CCC"
            )
            .where('S', controller.self())
            .where('P', <blockstate:appliedenergistics2:spatial_pylon>)
            .where('G', <metastate:gregtech:transparent_casing:1>)
            .where('O', <metastate:extendedcrafting:storage:4>)
            .where('N', <metastate:gregtech:meta_block_compressed_27:0>)
            .where('C', CTPredicate.states(<metastate:gcym:large_multiblock_casing:9>)
            | CTPredicate.abilities(<mte_ability:IMPORT_ITEMS>).setMinGlobalLimited(1).setPreviewCount(1)
            | CTPredicate.abilities(<mte_ability:EXPORT_ITEMS>).setMinGlobalLimited(1).setPreviewCount(1)
            | CTPredicate.abilities(<mte_ability:OUTPUT_ENERGY>).setMinGlobalLimited(1).setMaxGlobalLimited(3).setPreviewCount(1)
            )
            .build();
        } as IPatternBuilderFunction)
    .withRecipeMap(
        FactoryRecipeMap.start("naquadah_reactor_2")
            .minInputs(1)
            .maxInputs(1)
            .minOutputs(1)
            .maxOutputs(1)
            .build())
    .withBaseTexture(<metastate:gcym:large_multiblock_casing:9>)
    .buildAndRegister();

naquadah_reactor_2.hasMufflerMechanics = false;
naquadah_reactor_2.hasMaintenanceMechanics = false;
//naquadah_reactor_2.frontOverlay = <cube_renderer:CANNER_OVERLAY>;

naquadah_reactor_2.runOverclockingLogic = function(recipelogic as IRecipeLogic, recipe as IRecipe, negativeEU as bool, maxOverclocks as int) as int[] {
    return IRecipeLogic.standardOverclockingLogic(recipe.getEUt() * (negativeEU ? -1 : 1), recipelogic.maxVoltage, recipe.getDuration(), 1, 1, 0); // 1x duration, 1x voltage, 0 overclocks
} as IRunOverclockingLogicFunction;

<metaitem:multiblocktweaker:naquadah_reactor_2>.addTooltip(format.yellow("Produces exactly 3A UV, does not overclock"));

// creative tank provider
// creative tank
creative_tank_provider.recipeMap
    .recipeBuilder()
    .notConsumable(<contenttweaker:creativeportabletankmold>)
    .inputs(<minecraft:bucket>)
    .outputs(<metaitem:creative_tank>)
    .duration(500)
    .EUt(100000)
    .buildAndRegister();


// Naquadah Reactor Mk1 Recipes
naquadah_reactor_1.recipeMap
    .recipeBuilder()
    .duration(938)
    .EUt(-393216)
    .inputs(<metaitem:boltNaquadahEnriched>)
    .outputs(<metaitem:boltLead>)
    .buildAndRegister();

naquadah_reactor_1.recipeMap
    .recipeBuilder()
    .duration(3750)
    .EUt(-393216)
    .inputs(<metaitem:boltNaquadria>)
    .outputs(<metaitem:boltLead>)
    .buildAndRegister();

// Naquadah Reactor Mk2 Recipes
naquadah_reactor_2.recipeMap
    .recipeBuilder()
    .duration(1875)
    .EUt(-1572864)
    .inputs(<metaitem:boltNaquadahEnriched>)
    .outputs(<metaitem:boltLead>)
    .buildAndRegister();

naquadah_reactor_2.recipeMap
    .recipeBuilder()
    .duration(7500)
    .EUt(-1572864)
    .inputs(<metaitem:boltNaquadria>)
    .outputs(<metaitem:boltLead>)
    .buildAndRegister();
