SMODS.Joker{ --Butcher Vanity
    key = "butchervanity",
    config = {
        extra = {
            mult = 1,
            inc = 1,
            numera = 1,
            denomina = 5,
        }
    },
    loc_txt = {
        ['name'] = 'Butcher Vanity',
        ['text'] = {
            [1] = '{C:attention}#3#/#4#{} chance to destroy',
            [2] = 'a random consumable',
            [3] = 'when hand is played',
            [4] = 'Gains {X:red,C:white}X#2#{} Mult for',
            [5] = 'every consumable destroyed',
            [6] = 'by this Joker',
            [7] = '{C:inactive,s:0.8}(Must have at least 1 consumeable){}',
            [8] = '{C:inactive}(Currently #1#X Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 3
    },
    cost = 4,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'jokers',

    loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, card.ability.extra.numera, card.ability.extra.denomina, 'j_mktjk_butchervanity') 
        return {vars = {card.ability.extra.mult, card.ability.extra.inc, new_numerator, new_denominator}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if #G.consumeables.cards >= 1 then
                if SMODS.pseudorandom_probability(card, 'group_0_9e342b2a', card.ability.extra.numera, card.ability.extra.denomina, 'j_mktjk_butchervanity', false) then
              local target_cards = {}
            for i, consumable in ipairs(G.consumeables.cards) do
                table.insert(target_cards, consumable)
            end
            if #target_cards > 0 then
                local card_to_destroy = pseudorandom_element(target_cards, pseudoseed('destroy_consumable'))
                G.E_MANAGER:add_event(Event({
                    func = function()
                        SMODS.destroy_cards(card_to_destroy)
                        return true
                    end
                }))
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed Consumable!", colour = G.C.RED})
            end
                        card.ability.extra.mult = (card.ability.extra.mult) + card.ability.extra.inc
                        
          end
            else
                return {
                    x_chips = card.ability.extra.mult
                }
            end
        end
    end
}
