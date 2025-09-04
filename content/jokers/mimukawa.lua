SMODS.Joker{ --Mimukawa Nice Try
    key = "mimukawa",
    config = {
        extra = {
            mult = 33
        }
    },
    loc_vars = function(self, info_queue, card)
        return { 
            vars = { card.ability.extra.mult } 
        }
    end,
    loc_txt = {
        ['name'] = 'Mimukawa Nice Try',
        ['text'] = {
            '{C:mult}+#1#{} Mult if',
            'scored hand contains',
            'exactly {C:attention}4{} cards'
        }
    },
    pos = {
        x = 4,
        y = 0
    },
    cost = 6,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'jokers',

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if #context.full_hand == 4 then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
    end
}