SMODS.Joker{ -- Waters Of Nazareth
    key = "wnazareth",
    config = {
        extra = {
            clubsindeck = 0,
            multiplier = 2
        }
    },
    loc_vars = function(self, info_queue, card)
        return { 
            vars = { card.ability.extra.multiplier } 
        }
    end,
    loc_txt = {
        ['name'] = 'Jokers Of Nazareth',
        ['text'] = {
            'Each {C:clubs}Club{} card held in',
            'hand gives {C:mult}+#1#{} Mult',
            'per {C:clubs}Club{} card',
            'in full deck'
        }
    },
    pos = {
        x = 5,
        y = 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'jokers',

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round  then
            if context.other_card:is_suit("Clubs") then
                return {
                    mult = ((function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if card.base.suit == 'Clubs' then count = count + 1 end end; return count end)()) * 2
                }
            end
        end
    end
}