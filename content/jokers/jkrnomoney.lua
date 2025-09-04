SMODS.Joker{ --jokerno$
    key = "jkrnomoney",
    config = {
        extra = {
            money_mult = 1.5
        }
    },
    loc_vars = function(self, queue, card) return {
        vars = {
            card.ability.extra.money_mult,
            math.max(1, card.ability.extra.money_mult * math.floor(0 - G.GAME.dollars))
        }
    } end,
    loc_txt = {
        ['name'] = 'jokerno$',
        ['text'] = {
            'Gains {X:mult,C:white}X#1#{} Mult for',
            'every {C:money}$1{} in {C:red}debt',
            '{C:inactive}(Currently {C:white,X:mult}X#2#{} {C:inactive}Mult)'
        }
    },
    pos = {
        x = 3,
        y = 1
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'jokers',

    set_ability = function(self, card, initial, delay_sprites)
      card:set_rental(true)
    end,

    calculate = function(self, card, context)
        if context.joker_main then
                return {xmult = math.max(1, card.ability.extra.money_mult * math.floor(0 - G.GAME.dollars))}
        end
    end
}
