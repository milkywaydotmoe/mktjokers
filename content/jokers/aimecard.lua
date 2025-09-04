SMODS.Joker{ --Aime Card
    key = "aimecard",
    config = {
        extra = {
            odds = 2,
            mult = 5
        }
    },
    loc_txt = {
        ['name'] = 'Aime Card',
        ['text'] = {
            '{C:green}1 in 2{} chance for',
            'scoring cards to return to deck.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 2
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'jokers',

-- this is a temporary effect. i will replace this once i figure out how to implement it

    calculate = function(self, card, context)
		if context.cardarea == G.play and context.individual then
			context.other_card.config.cycling = true
		end
	end
}