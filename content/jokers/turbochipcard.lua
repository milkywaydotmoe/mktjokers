SMODS.Joker { -- TurboChip Card
    key = "turbochipcard",
    config = {
        extra = {
            Planet = 0
        }
    },
    loc_txt = {
        ['name'] = 'TurboChip Card',
        ['text'] = {
            [1] = 'Create a random {C:planet}Planet{}',
            [2] = 'card when hand is played',
            [3] = '{C:inactive}(Must have room)'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 3
    },
    cost = 13,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'jokers',
    in_pool = function(self, args)
        return
            (not args or args.source ~= 'sho' or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or
                args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra') and true
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            local created_consumable = false
            if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                created_consumable = true
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                G.E_MANAGER:add_event(Event({
                    func = function()
                        SMODS.add_card {
                            set = 'Planet',
                            key = nil,
                            key_append = 'joker_forge_planet'
                        }
                        G.GAME.consumeable_buffer = 0
                        return true
                    end
                }))
            end
            return {
                message = created_consumable and localize('k_plus_planet') or nil
            }
        end
    end
}