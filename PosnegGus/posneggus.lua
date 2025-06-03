--- STEAMODDED HEADER
--- MOD_NAME: Posneg Gustime
--- MOD_ID: PosnegGus
--- MOD_AUTHOR: [Posneg]
--- MOD_DESCRIPTION: Gus's fun ideas, as implemented by me!
--- DISPLAY_NAME: Posneg's Gus Implementation
--- BADGE_COLOUR: C7387D
--- PRIORITY: 42

----------------------------------------------
------------MOD CODE -------------------------

SMODS.Atlas {
	key = "posneg_backs",
	path = "posneg_backs.png",
	px = 71,
	py = 95
}

SMODS.Back{
	name = "Infinite Deck",
	key = "pg_infinite",
	atlas = "posneg_backs",
	pos = {x = 0, y = 5},
	loc_txt = {
		name = "Infinite Deck",
		text = {
			"After defeating the",
			"{C:attention}Ante 8 Boss Blind{},",
			"add {C:dark_edition}negative{} to all",
			"of your {C:attention}Jokers{}"
		},
	},
	calculate = function(self, back, context)
		if context.context == 'eval' and G.GAME.last_blind and G.GAME.last_blind.boss and G.GAME.round_resets.ante == 9 then
			for k, v in pairs(G.jokers.cards) do
				if v.ability.set == 'Joker' and (not v.edition) then
					v:set_edition({negative = true})
				end
			end
		end
	end
}

SMODS.Back{
	name = "Hollywood Deck",
	key = "pg_hollywood",
	atlas = 'posneg_backs',
	pos = {x = 1, y = 5},
	config = {
		voucher = 'v_directors_cut',
		consumables = {'c_talisman'},
	},
	loc_txt = {
		name = "Hollywood Deck",
		text = {
			"Start run with the",
			"{C:attention,T:v_directors_cut}Director's Cut{} voucher",
			"and a {C:spectral,T:c_talisman}Talisman{} card"
		},
	}
}


SMODS.Back{
	name = "Dollar Deck",
	key = "pg_dollar",
	atlas = 'posneg_backs',
	pos = {x = 2, y = 5},
	config = {
		vouchers = {'v_reroll_surplus', 'v_reroll_glut'}
	},
	loc_txt = {
		name = "Dollar Deck",
		text = {
			"Start run with the",
			"{C:green,T:v_reroll_surplus}Reroll Surplus{} and",
			"{C:green,T:v_reroll_glut}Reroll Glut{} vouchers",
			"{C:red}-1{} shop size"
		},
	},
	apply = function()
		G.E_MANAGER:add_event(Event({
			func = function()
				change_shop_size(-1)
				return true
			end
		}))
	end
}

----------------------------------------------
------------MOD CODE END----------------------