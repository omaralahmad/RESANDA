local function run(msg, matches)

	if matches[1]:lower() == 'معلوماتي' then

		function get_id(arg, data)

			local username

			if data.first_name_ then

				if data.username_ then

					username = '@'..data.username_

				else

					username = '<i>No Username!</i>'

				end

				local telNum

				if data.phone_number_ then

					telNum = '+'..data.phone_number_

				else

					telNum = '----'

				end

				local lastName

				if data.last_name_ then

					lastName = data.last_name_

				else

					lastName = '----'

				end

				local rank

				if is_sudo(msg) then

					rank = 'Sudo👷'

				elseif is_owner(msg) then

					rank = 'Bot Owner👳'

				elseif is_admin(msg) then

					rank = 'Admin👮'

				elseif is_mod(msg) then

					rank = 'Moderator💂'

				else

					rank = 'Group Member👲'

				end

				local text = '<b>مَعلوماتــك👨💻🌟 :</b>\n..\n<b>الاسم الاول👨🏻‍💻 :</b> <i>'..data.first_name_..'</i>\n..\n<b>الاسم الثاني🐝💛 :</b> <i>'..lastName..'</i>\n..\n<b>المعرف💜✔️:</b> '..username..'\n..\n<b>الايدي🐝💛 :</b> [ <code>'..data.id_..'</code> ]\n..\n<b> ايدي الكروب🎙 :</b> [ <code>'..arg.chat_id..'</code> ]\n..\n<b>رقم هاتفك🏷 :</b> [ <code>'..telNum..'</code> ]\n..\n<b>موقعك🚁 :</b> <i>'..rank..'</i>\n..\n<i>BY DEV EVO🎴</i>'

				tdcli.sendMessage(arg.chat_id, msg.id_, 1, text, 1, 'html')

			end

		end

		tdcli_function({ ID = 'GetUser', user_id_ = msg.sender_user_id_, }, get_id, {chat_id=msg.chat_id_, user_id=msg.sendr_user_id_})

	end

end



return { patterns = 

	{ "^(معلوماتي)$" }, 

	run = run

	}