# Welcome to faceit-ruby
(A new gem is currently in the making, so until then this will be unattended)

Hello!
This is a implementation for most of the endpoints the Faceit Data v4 api offers, feel free to contribute or fork to fit your application.

Some of the examples are missing some data, so please check out faceits official api site to get complete results from these requests

## Installation

<p>Put this in your gemfile:</p>

```
gem 'faceit-ruby', git: 'https://github.com/kallelundgren93/faceit-ruby.git'
```


<p>Then run: </p>
<p><code>bundle install</code></p>

<p>Then create an app on <a href="https://developers.faceit.com/">Developer Faceit</a> to get a apikey, then select to create the apikey for Serverside</p>

<h2>Usage</h2>
<p>First you need to intialize the client:</p>

```client = Faceit::Client.new api_key: "YOUR-API-KEY"```

<p>Then you can start working towards the api</p>

## Searches endpoints

### GET /search/organizers Search for organizers

```client.search_organizers({name: "Swedish Pro League", offset: "0", limit: "2"})```
<i>Offset and limit is optional.</i>

#### Example result:
```
"Faceit::Response:0x007fca705819b0 
@items=[# Faceit::Organizer:0x007fca705819d8 @organization_id="4bba8091-77f3-40a5-a986-715d160e2b53", 
@name="Swedish Pro League", @partner=true, 
@avatar="https://d50m6q67g4bn3.cloudfront.net/organizer_avatar/4bba8091-77f3-40a5-a986-715d160e2b53_1528027743156", 
@games=["csgo"], @countries=["SE"], @active=true, @regions=[]"
```

#### Getting information
```res = client.search_organizers({name: "Swedish Pro League", offset: "0", limit: "2"})```
  
#### Extracting it:
```res.items.first.avatar```

#### Result:
```"https://d50m6q67g4bn3.cloudfront.net/organizer_avatar/4bba8091-77f3-40a5-a986-715d160e2b53_1528027743156"```
  

### GET /search/players Search for players

```client.search_players({nickname: "FrekvenZ", offset: "0", limit: "2"})```
<i>Offset and limit is optional.</i>

#### Example result:
```
"Faceit::Response:0x007fca701c1848 
@items=[#Faceit::Player:0x007fca701c18e8 @player_id="8ed9d1fa-351c-4cff-86f8-82d907a2e598", @nickname="FrekvenZ", @avatar="https://d50m6q67g4bn3.cloudfront.net/avatars/8ed9d1fa-351c-4cff-86f8-82d907a2e598_1447861864100", 
@country="se", @games=[{"name"=>"csgo", "skill_level"=>"6"}, {"name"=>"lol_EUW", "skill_level"=>"5"}], 
@status="AVAILABLE", @verified=false"
```

#### Getting information
```res = client.search_players({nickname: "FrekvenZ", offset: "0", limit: "2"})```
  
#### Extracting it:
```res.items.first.games```

#### Result:
```[{"name"=>"csgo", "skill_level"=>"6"}, {"name"=>"lol_EUW", "skill_level"=>"5"}]```

### GET /search/teams Search for teams
```client.search_teams({nickname: "Astralis (Astralis)", offset: "0", limit: "2"})```
<i>Offset and limit is optional.</i>

#### Example result:
```
Faceit::Response:0x007fca6e061f68 
@items=[#Faceit::Team:0x007fca6e0627b0 @team_id="46367ae8-1345-4482-90e9-3f2e35e137fc", 
@name="Astralis", @verified=false, @avatar="", @game="csgo", 
@faceit_url="https://www.faceit.com/{lang}/teams/46367ae8-1345-4482-90e9-3f2e35e137fc", 
@chat_room_id="team-46367ae8-1345-4482-90e9-3f2e35e137fc">, #Faceit::Team:0x007fca6e062788 
@team_id="79bcd0c8-c30c-48b3-8796-b329b9b960f6", @name="Astralis", @verified=false, @avatar="https://d50m6q67g4bn3.cloudfront.net/teams_avatars/79bcd0c8-c30c-48b3-8796-b329b9b960f6_1468258988760", @game="dota2", @faceit_url="https://www.faceit.com/{lang}/teams/79bcd0c8-c30c-48b3-8796-b329b9b960f6", 
@chat_room_id="team-79bcd0c8-c30c-48b3-8796-b329b9b960f6"
```

#### Getting information
```res = client.search_teams({nickname: "Astralis (Astralis)", offset: "0", limit: "2"})```

#### Extracting it:
```res.items.first.faceit_url```

#### Result:
```"https://www.faceit.com/{lang}/teams/46367ae8-1345-4482-90e9-3f2e35e137fc"```

### GET /search/tournaments Search for tournaments
```client.search_tournaments({name: "Weekly", offset: "0", limit: "2"})```
<i>Offset and limit is optional.</i>

#### Example result:
```
"Faceit::Response:0x007fca6d1436a8 
@items=[#Faceit::Tournament:0x007fca6d1437c0 @competition_id="99a90e8f-d1b9-44cf-a667-898f54bfb387", 
@competition_type="tournament", @name="Weekly Battle-Cup", @game="dota2", @region="US", 
@organizer_id="611751d3-099f-4fb0-8e6e-fb6e1cf95d61", @organizer_type="organization", 
@status="paid", @started_at=1522972800, @prize_type="points", @total_prize="5000", @players_joined=2, 
@players_checkedin=3, @slots=16>, Faceit::Tournament:0x007fca6d1436f8 @competition_id="0d5f846a-74e2-446e-9e24-e010aaf0f208", @competition_type="tournament", @name="Weekly Battle-Cup", @game="dota2", @region="US", 
@organizer_id="611751d3-099f-4fb0-8e6e-fb6e1cf95d61", @organizer_type="organization", 
@status="paid", @started_at=1523578500, @prize_type="points", @total_prize="5000", 
@players_joined=nil, @players_checkedin=2, @slots=16"
```

#### Getting information
```res = client.search_tournaments({name: "Weekly", offset: "0", limit: "2"})```

#### Extracting it:
```res.items.first.total_prize```

#### Result:
```"5000"```

## Players Endpoint
### GET /players/{player_id} Retrieve player details

```client.get_player("8ed9d1fa-351c-4cff-86f8-82d907a2e598")```

#### Example result:
```
"player_id"=>"8ed9d1fa-351c-4cff-86f8-82d907a2e598", "nickname"=>"FrekvenZ", "avatar"=>"https://d50m6q67g4bn3.cloudfront.net/avatars/8ed9d1fa-351c-4cff-86f8-82d907a2e598_1447861864100", "country"=>"se", "cover_image"=>"https://d50m6q67g4bn3.cloudfront.net/users_covers/8ed9d1fa-351c-4cff-86f8-82d907a2e598_1451521480559", "cover_featured_image"=>"", 
"infractions"=>{"last_infraction_date"=>"Sun Jan 22 22:37:16 UTC 2017", "afk"=>0, 
"leaver"=>0, "qm_not_checkedin"=>1, "qm_not_voted"=>0}, 
"platforms"=>{"steam"=>"STEAM_1:1:34352020"}, 
"games"=>{"csgo"=>{"game_profile_id"=>"d2c40bc0-22be-4f34-a4ef-f9e5e7171121", 
"region"=>"EU", 
"regions"=>{"EU"=>{"selected_ladder_id"=>"8230146b-db40-4d2c-aa41-a413925768e0"}}, 
"skill_level_label"=>"6", "game_player_id"=>"76561198028969769", 
"skill_level"=>6, "faceit_elo"=>1516, "game_player_name"=>"Lunkenn"}, 
"lol_EUW"=>{"game_profile_id"=>"8c0a78c2-3785-4f12-9a4d-0dc2876051e9", 
"region"=>"", 
"regions"=>{"EUW"=>{"selected_ladder_id"=>"756d3c69-4fd8-486b-b982-7903eaaf8ed6"}}, 
"skill_level_label"=>"5", "game_player_id"=>"30426811", "skill_level"=>5, "faceit_elo"=>1000, 
"game_player_name"=>"Lunkiboii"}}, "settings"=>{"language"=>"en"}, 
"friends_ids"=>["1b18544e-d9e4-4f2a-995d-790a4af7523c"], 
"bans"=>[], "new_steam_id"=>"[U:1:68704041]", 
"steam_id_64"=>"76561198028969769", 
"steam_nickname"=>"Lunkenn", "membership_type"=>"unlimited", 
"faceit_url"=>"https://www.faceit.com/{lang}/players/FrekvenZ"
```

#### Getting information
```res = client.get_player("8ed9d1fa-351c-4cff-86f8-82d907a2e598")```

#### Extracting it:
```res['player_id']```

#### Result:
```"8ed9d1fa-351c-4cff-86f8-82d907a2e598"```

### GET /players/?nickname={} Get player by nickname
```
client.get_player_by_nickname("FrekvenZ")

#OBS Case sensitive!!!!!!!!
```

#### Example result:
```
{"player_id"=>"8ed9d1fa-351c-4cff-86f8-82d907a2e598", "nickname"=>"FrekvenZ", "avatar"=>"https://d50m6q67g4bn3.cloudfront.net/avatars/8ed9d1fa-351c-4cff-86f8-82d907a2e598_1447861864100", "country"=>"se", 
"cover_image"=>"https://d50m6q67g4bn3.cloudfront.net/users_covers/8ed9d1fa-351c-4cff-86f8-82d907a2e598_1451521480559", "cover_featured_image"=>"", 
"infractions"=>{"last_infraction_date"=>"Sun Jan 22 22:37:16 UTC 2017", "afk"=>0, 
"leaver"=>0, "qm_not_checkedin"=>1, "qm_not_voted"=>0}, 
"platforms"=>{"steam"=>"STEAM_1:1:34352020"}, 
"games"=>{"csgo"=>{"game_profile_id"=>"d2c40bc0-22be-4f34-a4ef-f9e5e7171121", 
"region"=>"EU", "regions"=>{"EU"=>{"selected_ladder_id"=>"8230146b-db40-4d2c-aa41-a413925768e0"}}, 
"skill_level_label"=>"6", "game_player_id"=>"76561198028969769", "skill_level"=>6, 
"faceit_elo"=>1516, "game_player_name"=>"Lunkenn"}, 
"lol_EUW"=>{"game_profile_id"=>"8c0a78c2-3785-4f12-9a4d-0dc2876051e9", "region"=>"", "regions"=>{"EUW"=>{"selected_ladder_id"=>"756d3c69-4fd8-486b-b982-7903eaaf8ed6"}}, 
"skill_level_label"=>"5", "game_player_id"=>"30426811", "skill_level"=>5, "faceit_elo"=>1000, "game_player_name"=>"Lunkiboii"}}, "settings"=>{"language"=>"en"}, 
"friends_ids"=>["1b18544e-d9e4-4f2a-995d-790a4af7523c"], "bans"=>[], 
"new_steam_id"=>"[U:1:68704041]", "steam_id_64"=>"76561198028969769", 
"steam_nickname"=>"Lunkenn", "membership_type"=>"unlimited", 
"faceit_url"=>"https://www.faceit.com/{lang}/players/FrekvenZ"}
```

#### Getting information
```
res = client.get_player_by_nickname("FrekvenZ")
```

#### Extracting it:
```
res['cover_image']
```

#### Result:
```
"https://d50m6q67g4bn3.cloudfront.net/users_covers/8ed9d1fa-351c-4cff-86f8-82d907a2e598_1451521480559"
```

### GET /players/{player_id}/history Retrieve all matches of a player
```
client.get_player_history("8ed9d1fa-351c-4cff-86f8-82d907a2e598", "csgo", {from: 946684800, offset: 0, limit: 1})
```
##### <i>There are also <b>to:</b> and <b>from:</b> options, from: will be 1 month if not specified and to: current_timestamp. 
  OBS! both these options require UNIX timestamp</i>
<i>Offset and limit is optional.</i>

#### Example result:
```
"items"=>[{"match_id"=>"18aa5180-f8a1-43e6-80aa-0fd79a090e6b", "game_id"=>"csgo", 
"match_type"=>"5v5", "game_mode"=>"", "game_type"=>"QuickMatch", "best_of"=>1, 
"played"=>1, "max_players"=>10, "teams_size"=>5, 
"teams"=>{"faction1"=>{"team_id"=>"9e73ddbe-17a8-456a-918d-53c744128f30", 
"nickname"=>"team_MayTec", "avatar"=>"", "type"=>"mix", 
"players"=>[{"player_id"=>"590fbf1e-c737-4bf8-9fb8-0c1069c1c1d6", 
"nickname"=>"gERy2001", 
"avatar"=>"https://d50m6q67g4bn3.cloudfront.net/avatars/590fbf1e-c737-4bf8-9fb8-0c1069c1c1d6_1519456094500",
"skill_level"=>0, "game_player_id"=>"76561197961534207", 
"game_player_name"=>"gery2k14 boiss =D", "faceit_url"=>"https://www.faceit.com/{lang}/players/gERy2001"}, {

"player_id"=>"70068c58-1cf6-4d4e-b2ed-0b3e8f5ed28e", 
"nickname"=>"Chik_i", 
"avatar"=>"https://d50m6q67g4bn3.cloudfront.net/avatars/70068c58-1cf6-4d4e-b2ed-0b3e8f5ed28e_1525184062428", 
"skill_level"=>0, 
"game_player_id"=>"76561198371886762", "game_player_name"=>"ChiK_i", 
"faceit_url"=>"https://www.faceit.com/{lang}/players/Chik_i"}, 
{"player_id"=>"962b1651-f0c2-4408-b944-2205947215df", "nickname"=>"_CoasT_", 
"avatar"=>"https://d50m6q67g4bn3.cloudfront.net/avatars/962b1651-f0c2-4408-b944-2205947215df_1520787013582", 
"skill_level"=>0, "game_player_id"=>"76561198428426852", "game_player_name"=>"Getrudes", 
"faceit_url"=>"https://www.faceit.com/{lang}/players/_CoasT_"}, 
{"player_id"=>"9e73ddbe-17a8-456a-918d-53c744128f30", "nickname"=>"MayTec", 
"avatar"=>"https://d50m6q67g4bn3.cloudfront.net/avatars/9e73ddbe-17a8-456a-918d-53c744128f30_1480559442664", 
"skill_level"=>0, "game_player_id"=>"76561198000939712", "game_player_name"=>"MayTec", 
"faceit_url"=>"https://www.faceit.com/{lang}/players/MayTec"}, 
{"player_id"=>"f6ce6dc5-4a0b-458c-aa15-0b3210521fd6", "nickname"=>"ProDy10", 
"avatar"=>"https://d50m6q67g4bn3.cloudfront.net/avatars/f6ce6dc5-4a0b-458c-aa15-0b3210521fd6_1504386982531", 
"skill_level"=>0, "game_player_id"=>"76561198265543744", "game_player_name"=>"76561198265543744", 
"faceit_url"=>"https://www.faceit.com/{lang}/players/ProDy10"}]}, 
"faction2"=>{"team_id"=>"3fb9afda-c451-446d-a425-7672d6b990b3", "nickname"=>"team_RealiNs8T", "avatar"=>"", "type"=>"mix",
"players"=>[{"player_id"=>"1b18544e-d9e4-4f2a-995d-790a4af7523c", "nickname"=>"RealiNs8T", 
"avatar"=>"https://d50m6q67g4bn3.cloudfront.net/avatars/1b18544e-d9e4-4f2a-995d-790a4af7523c_1447177984631", 
"skill_level"=>0, "game_player_id"=>"76561197960390498", "game_player_name"=>"iNs8T - Gamersmotcancer.se", 
"faceit_url"=>"https://www.faceit.com/{lang}/players/RealiNs8T"}, {"player_id"=>"55a832ad-2c65-4e04-a0c4-0729b0314151", 
"nickname"=>"NiNYa", 
"avatar"=>"https://d50m6q67g4bn3.cloudfront.net/avatars/55a832ad-2c65-4e04-a0c4-0729b0314151_1524082270135", 
"skill_level"=>0, "game_player_id"=>"76561198001957640", "game_player_name"=>"ninya ♥ znajd3r", 
"faceit_url"=>"https://www.faceit.com/{lang}/players/NiNYa"}, 
{"player_id"=>"8ed9d1fa-351c-4cff-86f8-82d907a2e598", "nickname"=>"FrekvenZ", 
"avatar"=>"https://d50m6q67g4bn3.cloudfront.net/avatars/8ed9d1fa-351c-4cff-86f8-82d907a2e598_1447861864100", 
"skill_level"=>0, "game_player_id"=>"76561198028969769", "game_player_name"=>"Lunkenn", 
"faceit_url"=>"https://www.faceit.com/{lang}/players/FrekvenZ"}, 
{"player_id"=>"9cbe80fd-aa67-40f9-a825-7c12f2997958", "nickname"=>"SebbeSmith", 
"avatar"=>"https://d50m6q67g4bn3.cloudfront.net/avatars/9cbe80fd-aa67-40f9-a825-7c12f2997958_1428340598939", 
"skill_level"=>0, "game_player_id"=>"76561198062755726", "game_player_name"=>"CB =DD", 
"faceit_url"=>"https://www.faceit.com/{lang}/players/SebbeSmith"}, 
{"player_id"=>"d0453c94-7c37-4d3e-a8b5-4be934552ae5", "nickname"=>"goffe-", 
"avatar"=>"https://d50m6q67g4bn3.cloudfront.net/avatars/d0453c94-7c37-4d3e-a8b5-4be934552ae5_1488982166682", 
"skill_level"=>0, "game_player_id"=>"76561197997347339", "game_player_name"=>"Goffeee", 
"faceit_url"=>"https://www.faceit.com/{lang}/players/goffe-"}]}}, 
"playing_players"=>["590fbf1e-c737-4bf8-9fb8-0c1069c1c1d6", "70068c58-1cf6-4d4e-b2ed-0b3e8f5ed28e", 
"962b1651-f0c2-4408-b944-2205947215df", "9e73ddbe-17a8-456a-918d-53c744128f30",
"f6ce6dc5-4a0b-458c-aa15-0b3210521fd6", "1b18544e-d9e4-4f2a-995d-790a4af7523c", 
"55a832ad-2c65-4e04-a0c4-0729b0314151", "8ed9d1fa-351c-4cff-86f8-82d907a2e598", 
"9cbe80fd-aa67-40f9-a825-7c12f2997958", "d0453c94-7c37-4d3e-a8b5-4be934552ae5"], 
"competition_id"=>"", "competition_name"=>"5v5", "competition_type"=>"QuickMatch", 
"organizer_id"=>"", "status"=>"finished", "started_at"=>1525872813, 
"finished_at"=>1525875266, 
"faceit_url"=>"https://www.faceit.com/{lang}/csgo/room/18aa5180-f8a1-43e6-80aa-0fd79a090e6b"}], 
"start"=>0, "end"=>1, "from"=>946684800, "to"=>1531837941
```

#### Getting information
```
res = client.get_player_history("8ed9d1fa-351c-4cff-86f8-82d907a2e598", "csgo", {from: 946684800, offset: 0, limit: 1})
```

#### Extracting it:
```
res['items'][0]['teams']['faction1']['players']
```

#### Result:
```
[{"player_id"=>"590fbf1e-c737-4bf8-9fb8-0c1069c1c1d6", "nickname"=>"gERy2001", 
"avatar"=>"https://d50m6q67g4bn3.cloudfront.net/avatars/590fbf1e-c737-4bf8-9fb8-0c1069c1c1d6_1519456094500", 
"skill_level"=>0, "game_player_id"=>"76561197961534207", "game_player_name"=>"gery2k14 boiss =D", 
"faceit_url"=>"https://www.faceit.com/{lang}/players/gERy2001"}, {"player_id"=>"70068c58-1cf6-4d4e-b2ed-0b3e8f5ed28e", 
"nickname"=>"Chik_i", 
"avatar"=>"https://d50m6q67g4bn3.cloudfront.net/avatars/70068c58-1cf6-4d4e-b2ed-0b3e8f5ed28e_1525184062428",
"skill_level"=>0, "game_player_id"=>"76561198371886762", "game_player_name"=>"ChiK_i", 
"faceit_url"=>"https://www.faceit.com/{lang}/players/Chik_i"}, {"player_id"=>"962b1651-f0c2-4408-b944-2205947215df", 
"nickname"=>"_CoasT_", 
"avatar"=>"https://d50m6q67g4bn3.cloudfront.net/avatars/962b1651-f0c2-4408-b944-2205947215df_1520787013582", 
"skill_level"=>0, "game_player_id"=>"76561198428426852", "game_player_name"=>"Getrudes", 
"faceit_url"=>"https://www.faceit.com/{lang}/players/_CoasT_"}, {"player_id"=>"9e73ddbe-17a8-456a-918d-53c744128f30", 
"nickname"=>"MayTec", 
"avatar"=>"https://d50m6q67g4bn3.cloudfront.net/avatars/9e73ddbe-17a8-456a-918d-53c744128f30_1480559442664", 
"skill_level"=>0, "game_player_id"=>"76561198000939712", "game_player_name"=>"MayTec", 
"faceit_url"=>"https://www.faceit.com/{lang}/players/MayTec"}, {"player_id"=>"f6ce6dc5-4a0b-458c-aa15-0b3210521fd6", 
"nickname"=>"ProDy10", 
"avatar"=>"https://d50m6q67g4bn3.cloudfront.net/avatars/f6ce6dc5-4a0b-458c-aa15-0b3210521fd6_1504386982531", 
"skill_level"=>0, "game_player_id"=>"76561198265543744", "game_player_name"=>"76561198265543744", 
"faceit_url"=>"https://www.faceit.com/{lang}/players/ProDy10"}]
```

### GET /players/{player_id}/stats/{game_id} Retrieve statistics of a player
```
client.get_player_stats("8ed9d1fa-351c-4cff-86f8-82d907a2e598", "csgo")
```

#### Example result:
```
{"player_id"=>"8ed9d1fa-351c-4cff-86f8-82d907a2e598", "game_id"=>"csgo", "lifetime"=>{"Average Headshots %"=>"37", 
"Average K/D Ratio"=>"0.92", "Current Win Streak"=>"1", "K/D Ratio"=>"408.85", "Longest Win Streak"=>"8", 
"Matches"=>"444", "Recent Results"=>["1", "1", "0", "0", "1"], "Total Headshots %"=>"16377", 
"Win Rate %"=>"54", "Wins"=>"241"}, 
"segments"=>[{"img_regular"=>"https://d50m6q67g4bn3.cloudfront.net/stats_assets/csgo/maps/200x125/csgo-votable-maps-de_cache-200x125.jpg", 
"img_small"=>"https://d50m6q67g4bn3.cloudfront.net/stats_assets/csgo/maps/110x55/csgo-votable-maps-de_cache-110x55.jpg",
"label"=>"de_cache", "mode"=>"5v5", "stats"=>{"Assists"=>"355", "Average Assists"=>"4.55", 
"Average Deaths"=>"20.4", "Average Headshots %"=>"38", "Average K/D Ratio"=>"0.81", "Average K/R Ratio"=>"0.61", 
"Average Kills"=>"16.28", "Average MVPs"=>"2.49", "Average Penta Kills"=>"0.01", "Average Quadro Kills"=>"0.09", 
"Average Triple Kills"=>"0.95", "Deaths"=>"1591", "Headshots"=>"481", "Headshots per Match"=>"6.17", 
"K/D Ratio"=>"63.11", "K/R Ratio"=>"47.2", "Kills"=>"1270", "MVPs"=>"194", "Matches"=>"78", "Penta Kills"=>"1", 
"Quadro Kills"=>"7", "Rounds"=>"2064", "Total Headshots %"=>"2991", "Triple Kills"=>"74", "Win Rate %"=>"53", 
"Wins"=>"41"}, "type"=>"Map"}, 
{"img_regular"=>"https://d50m6q67g4bn3.cloudfront.net/stats_assets/csgo/maps/200x125/csgo-votable-maps-de_cbbl-200x125.jpg",
"img_small"=>"https://d50m6q67g4bn3.cloudfront.net/stats_assets/csgo/maps/110x55/csgo-votable-maps-de_cbbl-110x55.jpg",
"label"=>"de_cbble", "mode"=>"5v5", "stats"=>{"Assists"=>"301", "Average Assists"=>"4.36", "Average Deaths"=>"19.16", 
"Average Headshots %"=>"36", "Average K/D Ratio"=>"0.91", "Average K/R Ratio"=>"0.64", "Average Kills"=>"16.68", 
"Average MVPs"=>"2.35", "Average Penta Kills"=>"0", "Average Quadro Kills"=>"0.17", "Average Triple Kills"=>"0.96",
"Deaths"=>"1322", "Headshots"=>"414", "Headshots per Match"=>"6", "K/D Ratio"=>"62.51", "K/R Ratio"=>"44.13", 
"Kills"=>"1151", "MVPs"=>"162", "Matches"=>"69", "Penta Kills"=>"0", "Quadro Kills"=>"12", "Rounds"=>"1796", 
"Total Headshots %"=>"2486", "Triple Kills"=>"66", "Win Rate %"=>"51", "Wins"=>"35"}, "type"=>"Map"}, 
{"img_regular"=>"https://d50m6q67g4bn3.cloudfront.net/stats_assets/csgo/maps/200x125/csgo-votable-maps-de_season-200x125.jpg", 
"img_small"=>"https://d50m6q67g4bn3.cloudfront.net/stats_assets/csgo/maps/110x55/csgo-votable-maps-de_season-110x55.jpg",
"label"=>"de_season", "mode"=>"5v5", "stats"=>{"Assists"=>"5", "Average Assists"=>"5", "Average Deaths"=>"22", 
"Average Headshots %"=>"55", "Average K/D Ratio"=>"0.5", "Average K/R Ratio"=>"0.41", "Average Kills"=>"11", 
"Average MVPs"=>"1", "Average Penta Kills"=>"0", "Average Quadro Kills"=>"0", "Average Triple Kills"=>"1", 
"Deaths"=>"22", "Headshots"=>"6", "Headshots per Match"=>"6", "K/D Ratio"=>"0.5", "K/R Ratio"=>"0.41", 
"Kills"=>"11", "MVPs"=>"1", "Matches"=>"1", "Penta Kills"=>"0", "Quadro Kills"=>"0", "Rounds"=>"27", 
"Total Headshots %"=>"55", "Triple Kills"=>"1", "Win Rate %"=>"0", "Wins"=>"0"}, "type"=>"Map"}, 
{"img_regular"=>"https://d50m6q67g4bn3.cloudfront.net/stats_assets/csgo/maps/200x125/csgo-votable-maps-de_mirage-200x125.jpg", 
"img_small"=>"https://d50m6q67g4bn3.cloudfront.net/stats_assets/csgo/maps/110x55/csgo-votable-maps-de_mirage-110x55.jpg",
"label"=>"de_mirage", "mode"=>"5v5", "stats"=>{"Assists"=>"540", "Average Assists"=>"4.32", 
"Average Deaths"=>"18.92", "Average Headshots %"=>"38", "Average K/D Ratio"=>"0.97", "Average K/R Ratio"=>"0.66", 
"Average Kills"=>"17.14", "Average MVPs"=>"2.48", "Average Penta Kills"=>"0.01", "Average Quadro Kills"=>"0.14", 
"Average Triple Kills"=>"0.7", "Deaths"=>"2365", "Headshots"=>"803", "Headshots per Match"=>"6.42", 
"K/D Ratio"=>"121.61", "K/R Ratio"=>"82.31", "Kills"=>"2142", "MVPs"=>"310", "Matches"=>"125", "Penta Kills"=>"1", 
"Quadro Kills"=>"18", "Rounds"=>"3271", "Total Headshots %"=>"4715", "Triple Kills"=>"87", 
"Win Rate %"=>"58", "Wins"=>"72"}, "type"=>"Map"}, 
{"img_regular"=>"https://d50m6q67g4bn3.cloudfront.net/stats_assets/csgo/maps/200x125/csgo-votable-maps-de_inferno-200x125.jpg", 
"img_small"=>"https://d50m6q67g4bn3.cloudfront.net/stats_assets/csgo/maps/110x55/csgo-votable-maps-de_inferno-110x55.jpg", 
"label"=>"de_inferno", "mode"=>"5v5", "stats"=>{"Assists"=>"256", "Average Assists"=>"4.92", 
"Average Deaths"=>"20.67", "Average Headshots %"=>"40", "Average K/D Ratio"=>"0.91", "Average K/R Ratio"=>"0.64", 
"Average Kills"=>"17.75", "Average MVPs"=>"2.62", "Average Penta Kills"=>"0", "Average Quadro Kills"=>"0.15", 
"Average Triple Kills"=>"0.81", "Deaths"=>"1075", "Headshots"=>"367", "Headshots per Match"=>"7.06", 
"K/D Ratio"=>"47.47", "K/R Ratio"=>"33.11", "Kills"=>"923", "MVPs"=>"136", "Matches"=>"52", "Penta Kills"=>"0", 
"Quadro Kills"=>"8", "Rounds"=>"1454", "Total Headshots %"=>"2090", "Triple Kills"=>"42", "Win Rate %"=>"56", 
"Wins"=>"29"}, "type"=>"Map"}, 
{"img_regular"=>"https://d50m6q67g4bn3.cloudfront.net/stats_assets/csgo/maps/200x125/csgo-votable-maps-de_overpass-200x125.jpg", 
"img_small"=>"https://d50m6q67g4bn3.cloudfront.net/stats_assets/csgo/maps/110x55/csgo-votable-maps-de_overpass-110x55.jpg",
"label"=>"de_overpass", "mode"=>"5v5", "stats"=>{"Assists"=>"225", 
"Average Assists"=>"4.5", "Average Deaths"=>"20.18", "Average Headshots %"=>"32", "Average K/D Ratio"=>"0.96", 
"Average K/R Ratio"=>"0.7", "Average Kills"=>"18.78", "Average MVPs"=>"2.74", "Average Penta Kills"=>"0.02", 
"Average Quadro Kills"=>"0.2", "Average Triple Kills"=>"0.9", "Deaths"=>"1009", "Headshots"=>"307", 
"Headshots per Match"=>"6.14", "K/D Ratio"=>"47.86", "K/R Ratio"=>"35.06", "Kills"=>"939", "MVPs"=>"137", 
"Matches"=>"50", "Penta Kills"=>"1", "Quadro Kills"=>"10", "Rounds"=>"1327", "Total Headshots %"=>"1610", 
"Triple Kills"=>"45", "Win Rate %"=>"52", "Wins"=>"26"}, "type"=>"Map"}, 
{"img_regular"=>"https://d50m6q67g4bn3.cloudfront.net/stats_assets/csgo/maps/200x125/csgo-votable-maps-de_nuke-200x125.jpg", 
"img_small"=>"https://d50m6q67g4bn3.cloudfront.net/stats_assets/csgo/maps/110x55/csgo-votable-maps-de_nuke-110x55.jpg", 
"label"=>"de_nuke", "mode"=>"5v5", "stats"=>{"Assists"=>"39", "Average Assists"=>"4.33", "Average Deaths"=>"17.67", 
"Average Headshots %"=>"22", "Average K/D Ratio"=>"1.02", "Average K/R Ratio"=>"0.67", "Average Kills"=>"17.33", 
"Average MVPs"=>"3.33", "Average Penta Kills"=>"0", "Average Quadro Kills"=>"0", "Average Triple Kills"=>"1.22", 
"Deaths"=>"159", "Headshots"=>"39", "Headshots per Match"=>"4.33", "K/D Ratio"=>"9.18", "K/R Ratio"=>"6.04", 
"Kills"=>"156", "MVPs"=>"30", "Matches"=>"9", "Penta Kills"=>"0", "Quadro Kills"=>"0", "Rounds"=>"224", 
"Total Headshots %"=>"198", "Triple Kills"=>"11", "Win Rate %"=>"56", "Wins"=>"5"}, "type"=>"Map"}, 
{"img_regular"=>"https://d50m6q67g4bn3.cloudfront.net/stats_assets/csgo/maps/200x125/csgo-votable-maps-de_dust2-200x125.jpg", 
"img_small"=>"https://d50m6q67g4bn3.cloudfront.net/stats_assets/csgo/maps/110x55/csgo-votable-maps-de_dust2-110x55.jpg", 
"label"=>"de_dust2", "mode"=>"5v5", "stats"=>{"Assists"=>"150", "Average Assists"=>"4.05", 
"Average Deaths"=>"19.73", "Average Headshots %"=>"37", "Average K/D Ratio"=>"0.95", "Average K/R Ratio"=>"0.65", 
"Average Kills"=>"17.08", "Average MVPs"=>"2.38", "Average Penta Kills"=>"0.03", "Average Quadro Kills"=>"0.24", 
"Average Triple Kills"=>"0.95", "Deaths"=>"730", "Headshots"=>"239", "Headshots per Match"=>"6.46", 
"K/D Ratio"=>"35.15", "K/R Ratio"=>"23.97", "Kills"=>"632", "MVPs"=>"88", "Matches"=>"37", "Penta Kills"=>"1", 
"Quadro Kills"=>"9", "Rounds"=>"991", "Total Headshots %"=>"1374", "Triple Kills"=>"35", "Win Rate %"=>"51", 
"Wins"=>"19"}, "type"=>"Map"}, 
{"img_regular"=>"https://d50m6q67g4bn3.cloudfront.net/stats_assets/csgo/maps/200x125/csgo-votable-maps-de_train-200x125.jpg", 
"img_small"=>"https://d50m6q67g4bn3.cloudfront.net/stats_assets/csgo/maps/110x55/csgo-votable-maps-de_train-110x55.jpg", 
"label"=>"de_train", "mode"=>"5v5", "stats"=>{"Assists"=>"80", "Average Assists"=>"3.64", 
"Average Deaths"=>"19.82", "Average Headshots %"=>"38", "Average K/D Ratio"=>"0.95", "Average K/R Ratio"=>"0.66", 
"Average Kills"=>"18.27", "Average MVPs"=>"2.77", "Average Penta Kills"=>"0.05", "Average Quadro Kills"=>"0.05", 
"Average Triple Kills"=>"0.95", "Deaths"=>"436", "Headshots"=>"145", "Headshots per Match"=>"6.59", 
"K/D Ratio"=>"20.91", "K/R Ratio"=>"14.61", "Kills"=>"402", "MVPs"=>"61", "Matches"=>"22", "Penta Kills"=>"1", 
"Quadro Kills"=>"1", "Rounds"=>"603", "Total Headshots %"=>"833", "Triple Kills"=>"21", "Win Rate %"=>"64", 
"Wins"=>"14"}, "type"=>"Map"}, 
{"img_regular"=>"https://d50m6q67g4bn3.cloudfront.net/stats_assets/csgo/maps/200x125/csgo-votable-maps-de_mirage-200x125.jpg", 
"img_small"=>"https://d50m6q67g4bn3.cloudfront.net/stats_assets/csgo/maps/110x55/csgo-votable-maps-de_mirage-110x55.jpg", 
"label"=>"de_mirage", "mode"=>"5v5PREMADE", "stats"=>{"Assists"=>"2", "Average Assists"=>"2", 
"Average Deaths"=>"22", "Average Headshots %"=>"25", "Average K/D Ratio"=>"0.55", "Average K/R Ratio"=>"0.46", 
"Average Kills"=>"12", "Average MVPs"=>"0", "Average Penta Kills"=>"0", "Average Quadro Kills"=>"0", 
"Average Triple Kills"=>"0", "Deaths"=>"22", "Headshots"=>"3", "Headshots per Match"=>"3", "K/D Ratio"=>"0.55", 
"K/R Ratio"=>"0.46", "Kills"=>"12", "MVPs"=>"0", "Matches"=>"1", "Penta Kills"=>"0", "Quadro Kills"=>"0", 
"Rounds"=>"26", "Total Headshots %"=>"25", "Triple Kills"=>"0", "Win Rate %"=>"0", "Wins"=>"0"}, "type"=>"Map"}]}
```

#### Getting information
```
res = client.get_player_stats("8ed9d1fa-351c-4cff-86f8-82d907a2e598", "csgo")
```

#### Extracting it:
```
res['lifetime']
```

#### Result:
```
{"Average Headshots %"=>"37", 
"Average K/D Ratio"=>"0.92", 
"Current Win Streak"=>"1", 
"K/D Ratio"=>"408.85", 
"Longest Win Streak"=>"8", 
"Matches"=>"444", 
"Recent Results"=>["1", "1", "0", "0", "1"], 
"Total Headshots %"=>"16377", "Win Rate %"=>"54", 
"Wins"=>"241"}
```

## Games Endpoint

### GET /games Retrieve details of all games on FACEIT
```
client.get_games(nil)
```
<i>The reason behind why you have to do nil is that the same method is used in retrieving a specific game. 
  So nil for all games and game id for a specific game</i>

#### Example result:
```
Faceit::Game:0x007f94301e90f8 @game_id="tf2", @short_label="TF2", 
@long_label="Team Fortress 2", @cover="https://cdn.faceit.com/games/game-covers/tf2_game_cover_2000x100.jpg",
@flag_img_icon="https://cdn.faceit.com/games/game-flags/tf_Icons_16x16.png", 
@flag_img_s="https://cdn.faceit.com/games/game-flags/tf_Icons_24x24.png", 
@flag_img_m="https://cdn.faceit.com/games/game-flags/tf_Icons_48x48.png", 
@flag_img_l="https://cdn.faceit.com/games/game-flags/tf_Icons_96x96.png", 
@featured_img_s="https://cdn.faceit.com/games/gameboxes/gamebox_tf2_tiletall_sm_40x60.jpg", 
@featured_img_m="https://cdn.faceit.com/games/gameboxes/tf_212x320_open_beta.jpg", 
@featured_img_l="https://cdn.faceit.com/games/gameboxes/tf_424x640_open_beta.jpg", 
@landing_page="https://cdn.faceit.com/games/landing-page/game-boxes/tf2-with-logo.jpg", @platforms=["steam"], 
@regions=["EU", "US", "SA"], @parent_game_id="tf2"
```

#### Getting information
```
res = client.get_games(nil)
```

#### Extracting it:
```
res.items.first.game_id
```

#### Result:
```
"tf2"
```

### GET /games/{game_id} Retrieve game details
```
client.get_games("csgo")
```

#### Example result:
```
"game_id"=>"csgo", "short_label"=>"CS:GO", "long_label"=>"Counter-Strike: Global Offensive", 
"assets"=>{"cover"=>"https://cdn.faceit.com/games/game-covers/csgo_game_cover_2000x100.jpg", 
"flag_img_icon"=>"https://cdn.faceit.com/games/game-flags/gameflag_csgo_icon_16x16.png", 
"flag_img_s"=>"https://cdn.faceit.com/games/game-flags/gameflag_csgo_S_24x24.png", 
"flag_img_m"=>"https://cdn.faceit.com/games/game-flags/gameflag_csgo_L_48x48.png", 
"flag_img_l"=>"https://cdn.faceit.com/games/game-flags/gameflag_csgo_XL_96x96.png", 
"featured_img_s"=>"https://cdn.faceit.com/games/gameboxes/gamebox_csgo_tiletall_sm_40x60.jpg",
"featured_img_m"=>"https://cdn.faceit.com/games/gameboxes/gamebox_csgo_tiletall_212x320.jpg", 
"featured_img_l"=>"https://cdn.faceit.com/games/gameboxes/gamebox_csgo_tiletaller_424x640.jpg", 
"landing_page"=>"https://cdn.faceit.com/games/landing-page/game-boxes/csgo-with-logo.jpg"}, 
"platforms"=>["steam"], "regions"=>["EU", "US", "SEA", "Oceania", "SA"], 
"parent_game_id"=>"csgo", "order"=>0
```

#### Getting information
```
res = client.get_games("csgo")
```

#### Extracting it:
```
res['long_label']
```

#### Result:
```
"Counter-Strike: Global Offensive"
```

## Matches Endpoints

### GET /matches/{match_id} Retrieve match details
```
client.get_match("18aa5180-f8a1-43e6-80aa-0fd79a090e6b")
```

#### Example result:
```
{"match_id"=>"18aa5180-f8a1-43e6-80aa-0fd79a090e6b", "version"=>1, "game"=>"csgo", "region"=>"EU", "competition_id"=>"", 
"competition_type"=>"quick_match", "competition_name"=>"", "organizer_id"=>"", "teams"=>{"faction1"=>
{"faction_id"=>"9e73ddbe-17a8-456a-918d-53c744128f30"............
```

#### Getting information
```
res = client.get_match("18aa5180-f8a1-43e6-80aa-0fd79a090e6b")
```

#### Extracting it:
```
res['region']
```

#### Result:
```
"EU"
```

### GET /matches/{match_id}/stats Retrieve statistics of a match
```
client.get_match_stats("18aa5180-f8a1-43e6-80aa-0fd79a090e6b")
```

#### Example result:
```
"rounds"=>[{"best_of"=>"1", "competition_id"=>nil, "game_id"=>"csgo", "game_mode"=>"5v5", 
"match_id"=>"18aa5180-f8a1-43e6-80aa-0fd79a090e6b", "match_round"=>"1", "played"=>"1", 
"round_stats"=>{"Map"=>"de_mirage", "Region"=>"EU", "Rounds"=>"28", "Score"=>"12 / 16", 
"Winner"=>"3fb9afda-c451-446d-a425-7672d6b990b3"}, "teams"=>[{"team_id"=>"9e73ddbe-17a8-456a-918d-53c744128f30", 
"premade"=>false, "team_stats"=>{"Final Score"=>"12", "First Half Score"=>"6", "Overtime score"=>"0", 
"Second Half Score"=>"6", "Team"=>"team_MayTec", "Team Headshot"=>"10.6", "Team Win"=>"0"}, 
"players"=>[{"player_id"=>"590fbf1e-c737-4bf8-9fb8-0c1069c1c1d6", "nickname"=>"gERy2001", "player_stats"=>{"Assists"=>"2", 
"Deaths"=>"22", "Headshot"=>"8", "Headshots %"=>"67", "K/D Ratio"=>"0.55", "K/R Ratio"=>"0.43", "Kills"=>"12", "MVPs"=>"2",
"Penta Kills"=>"0", "Quadro Kills"=>"0", "Result"=>"0", "Triple Kills"=>"1"}}, 
{"player_id"=>.........
```

#### Getting information
```
res = client.get_match_stats("18aa5180-f8a1-43e6-80aa-0fd79a090e6b")
```

#### Extracting it:
```
res['rounds'].first['game_mode']
```

#### Result:
```
"5v5"
```

## Contribute
Please if you are missing something or see any changes that can be made for the better, dont be afraid to send out a PR. This is my first ever gem, so I'm very open to changes and learning more!
