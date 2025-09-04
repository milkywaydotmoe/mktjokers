SMODS.Joker{ --Rin Penrose And The Balatro Polycule
    key = "rinpenrose",
    config = {
        extra = {
            slots = 3
        }
    },
    loc_txt = {
        ['name'] = 'Rin Penrose And The Balatro Polycule',
        ['text'] = {
            '{C:attention}+3{} Joker slots'
        }
    },
    pos = {
        x = 7,
        y = 0
    },
    cost = 14,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'jokers',

    loc_vars = function(self, queue, card)
        return { 
            vars = { card.ability.extra.slots } 
        }
    end,

    add_to_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.slots
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit - card.ability.extra.slots
    end
}