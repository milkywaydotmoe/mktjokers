SMODS.Joker{ -- Halcyon Sentipydes
    key = "halcyon",
    config = {
        extra = {
            repetitions = 4
        }
    },
    loc_vars = function(self, info_queue, card)
        return { 
            vars = { card.ability.extra.repetitions } 
        }
    end,
    loc_txt = {
        ['name'] = 'Halcyon Sentipydes',
        ['text'] = {
            'Retrigger {C:attention}first{} played card used', 
            'in scoring {C:attention}#1#{} additional times'
        }
    },
    pos = {
        x = 1,
        y = 1
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'jokers',

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play  then
            if context.other_card == context.scoring_hand[1] then
                return {
                    repetitions = card.ability.extra.repetitions,
                    message = localize('k_again_ex')
                }
            end
        end
    end
}