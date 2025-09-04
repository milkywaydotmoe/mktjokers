SMODS.Joker { -- Aikoyoris Bluetooth
    key = "aikoyorisbluetooth",
    config = {
        extra = {
            odds = 1000,
            ignore = 0
        }
    },
    loc_txt = {
        ['name'] = "Aikoyori's Bluetooth",
        ['text'] = {
            [1] = '{C:green}#2# in #3#{} chance to create',
            [2] = 'a {C:edition}Negative{} copy of',
            [3] = 'Joker to the left',
            [4] = 'when hand is played'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 4
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
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds,
            'j_modprefix_aikoyorisbluetooth')
        return {
            vars = {card.ability.extra.ignore, new_numerator, new_denominator}
        }
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_9195a6e3', 1, card.ability.extra.odds,
                    'j_modprefix_aikoyorisbluetooth', false) then
                    local my_pos = nil
                    for i = 1, #G.jokers.cards do
                        if G.jokers.cards[i] == card then
                            my_pos = i
                            break
                        end
                    end
                    local target_joker = (my_pos and my_pos > 1) and G.jokers.cards[my_pos - 1] or nil

                    if target_joker then
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                local copied_joker = copy_card(target_joker, nil, nil, nil,
                                    target_joker.edition and target_joker.edition.negative)
                                copied_joker:set_edition("e_negative", true)

                                copied_joker:add_to_deck()
                                G.jokers:emplace(copied_joker)
                                return true
                            end
                        }))
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {
                            message = localize('k_duplicated_ex'),
                            colour = G.C.GREEN
                        })
                    end

                end
            end
        end
    end
}
