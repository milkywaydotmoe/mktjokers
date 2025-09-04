SMODS.Joker{ --tbh creature
    key = "tbhcreature",
    config = {
        extra = {
            odds = 2
        }
    },
    loc_txt = {
        ['name'] = 'tbh creature',
        ['text'] = {
            [1] = '{C:green}#1# in #2#{} chance to create a',
            [2] = 'random {C:dark_edition}Negative{} {C:attention}consumable',
            [3] = 'at end of round.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 3
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'jokers',

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.e_negative
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_modprefix_tbhcreature') 
        return {vars = {new_numerator, new_denominator}}
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_6a8ec3b4', 1, card.ability.extra.odds, 'j_mktjk', false) then
              SMODS.calculate_effect({func = function()local created_consumable = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local random_sets = {'Tarot', 'Planet', 'Spectral'}
                        local random_set = random_sets[math.random(1, #random_sets)]
                        SMODS.add_card{set=random_set, edition = 'e_negative', key_append='joker_forge_' .. random_set:lower()}
                        return true
                    end
                }))
                    if created_consumable then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "yippee!", colour = G.C.PURPLE})
                    end
                    return true
                end}, card)
          end
            end
        end
    end
}