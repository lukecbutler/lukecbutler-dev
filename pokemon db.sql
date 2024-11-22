CREATE TABLE Pokemon_Type (
    type_id INT PRIMARY KEY,   -- Unique identifier for each type (e.g., 1 for Fire, 2 for Water)
    typing VARCHAR(50) NOT NULL  -- The name of the type (e.g., 'Fire', 'Water', 'Grass')
);

INSERT INTO Pokemon_Type (type_id, typing) VALUES
(1, 'Normal'),
(2, 'Fire'),
(3, 'Water'),
(4, 'Electric'),
(5, 'Grass'),
(6, 'Ice'),
(7, 'Fighting'),
(8, 'Poison'),
(9, 'Ground'),
(10, 'Flying'),
(11, 'Psychic'),
(12, 'Bug'),
(13, 'Rock'),
(14, 'Ghost'),
(15, 'Dragon'),
(16, 'Dark'),
(17, 'Steel'),
(18, 'Fairy');

CREATE TABLE Pokemon_Master (
    master_id INT NOT NULL PRIMARY KEY,       -- Primary key, cannot be NULL
    species VARCHAR(50),                      -- Name of the Pokémon
    type1 INT,                                -- First type (foreign key to type table)
    type2 INT,                                -- Second type (foreign key to type table, can be NULL)
    feet INT,                                 -- Height in feet
    inches INT,                               -- Height in inches
    weight DECIMAL(5,1),                      -- Weight (e.g., 15.2 for kg/lbs)
    pokedex_ent VARCHAR(5000),                -- Pokedex entry (description of the Pokémon)
    FOREIGN KEY (type1) REFERENCES Pokemon_Type(type_id),  -- Foreign key to type1
    FOREIGN KEY (type2) REFERENCES Pokemon_Type(type_id)   -- Foreign key to type2
);

-- 1 - 29
INSERT INTO Pokemon_Master (master_id, species, type1, type2, feet, inches, weight, pokedex_ent) VALUES
(1, 'Bulbasaur', 5, 8, 2, 4, 15.2, 'A strange seed was planted on its back at birth. The plant sprouts and grows with this Pokémon.'),
(2, 'Ivysaur', 5, 8, 3, 3, 28.7, 'When the bulb on its back grows large, it appears to lose the ability to stand on its hind legs.'),
(3, 'Venusaur', 5, 8, 6, 7, 220.5, 'The plant blooms when it is absorbing solar energy. It stays on the move to seek sunlight.'),
(4, 'Charmander', 2, NULL, 2, 0, 18.7, 'Obviously prefers hot places. When it rains, steam is said to spout from the tip of its tail.'),
(5, 'Charmeleon', 2, NULL, 3, 7, 41.9, 'When it swings its burning tail, it elevates the temperature to unbearably high levels.'),
(6, 'Charizard', 2, 10, 5, 7, 199.5, 'Spits fire that is hot enough to melt boulders. Known to cause forest fires unintentionally.'),
(7, 'Squirtle', 3, NULL, 1, 8, 19.8, 'After birth, its back swells and hardens into a shell. Powerfully sprays foam from its mouth.'),
(8, 'Wartortle', 3, NULL, 3, 3, 49.6, 'Often hides in water to stalk unwary prey. For swimming fast, it moves its ears to maintain balance.'),
(9, 'Blastoise', 3, NULL, 5, 3, 188.5, 'A brutal Pokémon with pressurized water jets on its shell. They are used for high-speed tackles.'),
(10, 'Caterpie', 12, NULL, 1, 0, 6.4, 'Its short feet are tipped with suction pads that enable it to tirelessly climb slopes and walls.'),
(11, 'Metapod', 12, NULL, 2, 4, 21.8, 'This Pokémon is vulnerable to attack while its shell is soft, exposing its weak and tender body.'),
(12, 'Butterfree', 12, 10, 3, 7, 70.5, 'In battle, it flaps its wings at high speed to release highly toxic dust into the air.'),
(13, 'Weedle', 12, 8, 1, 0, 7.1, 'Often found in forests, eating leaves. It has a sharp stinger on its head that injects poison.'),
(14, 'Kakuna', 12, 8, 2, 0, 22.0, 'Almost incapable of moving, this Pokémon can only harden its shell to protect itself from predators.'),
(15, 'Beedrill', 12, 8, 3, 3, 65.0, 'Flies at high speed and attacks using its large venomous stingers on its forelegs and tail.'),
(16, 'Pidgey', 10, 1, 1, 0, 4.0, 'A common sight in forests and woods. It flaps its wings at ground level to kick up blinding sand.'),
(17, 'Pidgeotto', 10, 1, 3, 7, 66.1, 'Very protective of its sprawling territory, this Pokémon will fiercely peck at any intruder.'),
(18, 'Pidgeot', 10, 1, 4, 11, 87.1, 'When hunting, it skims the surface of water at high speed to pick off unwary prey such as Magikarp.'),
(19, 'Rattata', 1, NULL, 1, 0, 7.7, 'Bites anything when it attacks. Small and very quick, it is a common sight in many places.'),
(20, 'Raticate', 1, NULL, 2, 4, 40.8, 'It uses its whiskers to maintain its balance. It seems to slow down if they are cut off.'),
(21, 'Spearow', 10, 1, 1, 0, 4.4, 'Eats bugs in grassy areas. It has to flap its short wings at high speed to stay airborne.'),
(22, 'Fearow', 10, 1, 3, 11, 83.8, 'With its huge and magnificent wings, it can keep aloft without ever having to land for rest.'),
(23, 'Ekans', 8, NULL, 6, 7, 15.2, 'Moves silently and stealthily. Eats the eggs of birds, such as Pidgey and Spearow, whole.'),
(24, 'Arbok', 8, NULL, 11, 6, 143.3, 'The frightening patterns on its belly have been studied. Six variations have been confirmed.'),
(25, 'Pikachu', 4, NULL, 1, 4, 13.2, 'When several of these Pokémon gather, their electricity could build and cause lightning storms.'),
(26, 'Raichu', 4, NULL, 2, 7, 66.1, 'Its long tail serves as a ground to protect itself from its own high-voltage power.'),
(27, 'Sandshrew', 9, NULL, 2, 0, 26.5, 'Burrows deep underground in arid locations far from water. It only emerges to hunt for food.'),
(28, 'Sandslash', 9, NULL, 3, 3, 65.0, 'Curls up into a spiny ball when threatened. It can roll while curled up to attack or escape.'),
(29, 'Nidoran♀', 8, NULL, 1, 4, 15.4, 'Although small, its venomous barbs render this Pokémon dangerous. The female has smaller horns.');


-- 30 through 41
INSERT INTO Pokemon_Master (master_id, species, type1, type2, feet, inches, weight, pokedex_ent) VALUES
(30, 'Nidorina', 8, NULL, 2, 7, 44.1, 'The female\'s horn develops slowly. Prefers physical attacks such as clawing and biting.'),
(31, 'Nidoqueen', 8, 9, 4, 3, 132.3, 'Its hard scales provide strong protection. It uses its hefty bulk to execute powerful moves.'),
(32, 'Nidoran♂', 8, NULL, 1, 8, 19.8, 'Stiffens its ears to sense danger. The larger its horns, the more powerful its secreted venom.'),
(33, 'Nidorino', 8, NULL, 2, 11, 43.0, 'Its horn contains venom. If it stabs an enemy with the horn, the impact makes the poison leak out.'),
(34, 'Nidoking', 8, 9, 4, 7, 136.7, 'It uses its powerful tail in battle to smash, constrict, then break the prey\'s bones.'),
(35, 'Clefairy', 18, NULL, 2, 0, 16.5, 'Its magical and cute appeal has many admirers. It is rare and found only in certain areas.'),
(36, 'Clefable', 18, NULL, 4, 3, 88.2, 'A timid fairy Pokémon that is rarely seen. It will run and hide the moment it senses people.'),
(37, 'Vulpix', 2, NULL, 2, 0, 21.8, 'At the time of birth, it has just one tail. The tail splits from its tip as it grows older.'),
(38, 'Ninetales', 2, NULL, 3, 7, 43.9, 'Very smart and very vengeful. Grabbing one of its many tails could result in a 1,000-year curse.'),
(39, 'Jigglypuff', 18, NULL, 1, 8, 12.1, 'When its huge eyes light up, it sings a mysteriously soothing melody that lulls its enemies to sleep.'),
(40, 'Wigglytuff', 18, NULL, 3, 3, 26.5, 'Its body is full of elasticity. By inhaling deeply, it can continue to inflate itself without limit.'),
(41, 'Zubat', 8, 10, 2, 7, 16.5, 'Forms colonies in perpetually dark places. Uses ultrasonic waves to identify and approach targets.');


-- 42 through 70
INSERT INTO Pokemon_Master (master_id, species, type1, type2, feet, inches, weight, pokedex_ent) VALUES
(42, 'Golbat', 8, 10, 5, 3, 121.3, 'Once it strikes, it will not stop draining energy from the victim even if it gets too heavy to fly.'),
(43, 'Oddish', 5, 8, 1, 8, 11.9, 'During the day, it keeps its face buried in the ground. At night, it wanders around sowing its seeds.'),
(44, 'Gloom', 5, 8, 2, 7, 19.0, 'The fluid that oozes from its mouth isn\'t drool. It is a nectar that is used to attract prey.'),
(45, 'Vileplume', 5, 8, 3, 11, 41.0, 'The larger its petals, the more toxic pollen it contains. Its big head is heavy and hard to hold up.'),
(46, 'Paras', 12, 5, 1, 0, 11.9, 'Burrows under the ground to gnaw on tree roots. The mushrooms on its back absorb most of the nutrition.'),
(47, 'Parasect', 12, 5, 3, 3, 65.0, 'A host-parasite pair in which the parasite mushroom has taken over the host bug. Prefers damp places.'),
(48, 'Venonat', 12, 8, 3, 3, 66.1, 'Lives in the shadows of tall trees where it eats insects. It is attracted by light at night.'),
(49, 'Venomoth', 12, 8, 4, 11, 27.6, 'The powdery scales on its wings are hard to remove. They also contain poison that leaks out on contact.'),
(50, 'Diglett', 9, NULL, 0, 8, 1.8, 'Lives about one yard underground where it feeds on plant roots. It sometimes appears above ground.'),
(51, 'Dugtrio', 9, NULL, 2, 4, 73.4, 'A team of Diglett triplets. It triggers huge earthquakes by burrowing 60 miles underground.'),
(52, 'Meowth', 1, NULL, 1, 4, 9.3, 'Adores circular objects. Wanders the streets on a nightly basis to look for dropped loose change.'),
(53, 'Persian', 1, NULL, 3, 3, 70.5, 'Although its fur has many admirers, it is tough to raise as a pet because of its fickle meanness.'),
(54, 'Psyduck', 3, NULL, 2, 7, 43.2, 'While lulling its enemies with its vacant look, this wily Pokémon will use psychokinetic powers.'),
(55, 'Golduck', 3, NULL, 5, 7, 168.9, 'Often seen swimming elegantly by lakeshores. It is often mistaken for the Japanese monster, Kappa.'),
(56, 'Mankey', 7, NULL, 1, 8, 61.7, 'Extremely quick to anger. It could be docile one moment, then thrashing away the next instant.'),
(57, 'Primeape', 7, NULL, 3, 3, 70.5, 'Always furious and tenacious to boot. It will not abandon chasing its quarry until it is caught.'),
(58, 'Growlithe', 2, NULL, 2, 4, 41.9, 'Very protective of its territory. It will bark and bite to repel intruders from its space.'),
(59, 'Arcanine', 2, NULL, 6, 3, 341.7, 'A Pokémon that has been admired since the past for its beauty. It runs gracefully, as if on wings.'),
(60, 'Poliwag', 3, NULL, 2, 0, 27.3, 'Its newly grown legs prevent it from walking well. It appears to prefer swimming over walking.'),
(61, 'Poliwhirl', 3, NULL, 3, 3, 44.1, 'Capable of living in or out of water. When out of water, it sweats to keep its body slimy.'),
(62, 'Poliwrath', 3, 7, 4, 3, 119.0, 'An adept swimmer at both the front crawl and breaststroke. Easily overtakes the best human swimmers.'),
(63, 'Abra', 11, NULL, 2, 11, 43.0, 'Using its ability to read minds, it will identify impending danger and teleport to safety.'),
(64, 'Kadabra', 11, NULL, 4, 3, 124.6, 'It emits special alpha waves from its body that induce headaches just by being close by.'),
(65, 'Alakazam', 11, NULL, 4, 11, 105.8, 'Its brain can outperform a supercomputer. Its intelligence quotient is said to be 5,000.'),
(66, 'Machop', 7, NULL, 2, 7, 43.0, 'Loves to build its muscles. It trains in all styles of martial arts to become even stronger.'),
(67, 'Machoke', 7, NULL, 4, 11, 155.4, 'Its muscular body is so powerful, it must wear a power-save belt to be able to regulate its motions.'),
(68, 'Machamp', 7, NULL, 5, 3, 286.6, 'Using its heavy muscles, it throws powerful punches that can send the victim clear over the horizon.'),
(69, 'Bellsprout', 5, 8, 2, 4, 8.8, 'A carnivorous Pokémon that traps and eats bugs. It appears to use its root feet to replenish moisture.'),
(70, 'Weepinbell', 5, 8, 3, 3, 14.1, 'It spits out poison powder to immobilize the enemy and then finishes it with a spray of acid.');

-- 71 through 100
INSERT INTO Pokemon_Master (master_id, species, type1, type2, feet, inches, weight, pokedex_ent) VALUES
(71, 'Victreebel', 5, 8, 5, 7, 34.2, 'Said to live in huge colonies deep in jungles, although no one has ever returned from there.'),
(72, 'Tentacool', 3, 8, 2, 11, 100.3, 'Drifts in shallow seas. Anglers who hook them by accident are often punished by its stingers.'),
(73, 'Tentacruel', 3, 8, 5, 3, 121.3, 'The tentacles are normally kept short. On hunts, they are extended to ensnare and immobilize prey.'),
(74, 'Geodude', 13, 9, 1, 4, 44.1, 'Found in fields and mountains. Mistaking them for boulders, people often step or trip on them.'),
(75, 'Graveler', 13, 9, 3, 3, 231.5, 'Rolls down slopes to move. It rolls over any obstacle without slowing or changing its direction.'),
(76, 'Golem', 13, 9, 4, 7, 661.4, 'Its boulder-like body is extremely hard. It can easily withstand dynamite blasts without damage.'),
(77, 'Ponyta', 2, NULL, 3, 3, 66.1, 'Its hooves are ten times harder than diamond. It can trample anything completely flat in little time.'),
(78, 'Rapidash', 2, NULL, 5, 7, 209.4, 'Just loves to run. If it sees something faster than itself, it will give chase at top speed.'),
(79, 'Slowpoke', 3, 11, 3, 11, 79.4, 'Incredibly slow and dopey. It takes five seconds for it to feel pain when under attack.'),
(80, 'Slowbro', 3, 11, 5, 3, 173.1, 'The Shellder that is latched onto Slowpoke\'s tail is said to feed on the host\'s leftover scraps.'),
(81, 'Magnemite', 12, 17, 1, 0, 13.2, 'Uses anti-gravity to stay suspended. Appears without warning and uses Thunder Wave and similar moves.'),
(82, 'Magneton', 12, 17, 3, 3, 132.3, 'Formed by several Magnemite linked together. They frequently appear when sunspots flare up.'),
(83, 'Farfetch\'d', 10, 1, 2, 7, 33.1, 'The plant stalk it holds is its weapon. The stalk is used like a sword to cut all sorts of things.'),
(84, 'Doduo', 10, 1, 4, 7, 86.4, 'A bird that makes up for its poor flying with its fast foot speed. Leaves giant footprints.'),
(85, 'Dodrio', 10, 1, 5, 11, 187.8, 'Uses its three brains to execute complex plans. While two heads sleep, one head stays awake.'),
(86, 'Seel', 3, NULL, 3, 7, 198.4, 'The protruding horn on its head is very hard. It is used for bashing through thick ice.'),
(87, 'Dewgong', 3, 6, 5, 7, 264.6, 'Stores thermal energy in its body. Swims at a steady eight knots even in intensely cold waters.'),
(88, 'Grimer', 8, NULL, 2, 11, 66.1, 'Appears in filthy areas. It thrives by sucking up polluted sludge that is pumped out of factories.'),
(89, 'Muk', 8, NULL, 3, 11, 66.1, 'Thickly covered with a filthy, vile sludge. It is so toxic, even its footprints contain poison.'),
(90, 'Shellder', 3, NULL, 1, 0, 8.8, 'Its hard shell repels any kind of attack. It is vulnerable only when its shell is open.'),
(91, 'Cloyster', 3, 6, 4, 11, 292.1, 'Its shell is extremely hard. It cannot be shattered, even with a bomb. The shell opens only when it is attacking.'),
(92, 'Gastly', 8, 14, 4, 3, 0.2, 'Almost invisible, this gaseous Pokémon cloaks the target and puts it to sleep without notice.'),
(93, 'Haunter', 8, 14, 5, 3, 0.2, 'By licking, it saps the victim\'s life. It causes shaking that won\'t stop until the victim\'s demise.'),
(94, 'Gengar', 8, 14, 4, 11, 89.3, 'Under a full moon, this Pokémon likes to mimic the shadows of people and laugh at their fright.'),
(95, 'Onix', 9, 13, 28, 10, 463.0, 'As it grows, the stone portions of its body harden to become similar to black diamonds.'),
(96, 'Drowzee', 11, NULL, 3, 3, 71.4, 'Puts enemies to sleep, then eats their dreams. Occasionally gets sick from eating bad dreams.'),
(97, 'Hypno', 11, NULL, 5, 3, 166.7, 'When it locks eyes with an enemy, it uses a mix of PSI moves such as Hypnosis and Confusion.'),
(98, 'Krabby', 3, NULL, 1, 4, 14.3, 'Its pincers are not only powerful weapons, they are used for balance when walking sideways.'),
(99, 'Kingler', 3, NULL, 4, 3, 132.3, 'The large pincer has 10,000-horsepower strength. However, it is so heavy, it is difficult to aim.'),
(100, 'Voltorb', 4, NULL, 1, 8, 22.9, 'Usually found in power plants. Easily mistaken for a Poké Ball, it has zapped many people.');



-- 101 through 125
INSERT INTO Pokemon_Master (master_id, species, type1, type2, feet, inches, weight, pokedex_ent) VALUES
(101, 'Electrode', 4, NULL, 3, 11, 146.8, 'It stores electric energy under very high pressure. It often explodes with little or no provocation.'),
(102, 'Exeggcute', 5, 11, 1, 4, 5.5, 'Often mistaken for eggs. When disturbed, they quickly gather and attack in swarms.'),
(103, 'Exeggutor', 5, 11, 6, 7, 264.6, 'Its three heads think independently. However, they are friendly and never appear to squabble.'),
(104, 'Cubone', 9, NULL, 1, 4, 14.3, 'Because it never removes its skull helmet, no one has ever seen this Pokémon''s real face.'),
(105, 'Marowak', 9, NULL, 3, 3, 99.2, 'The bone it holds is its key weapon. It throws the bone skillfully like a boomerang to KO targets.'),
(106, 'Hitmonlee', 7, NULL, 4, 11, 109.8, 'When in a hurry, its legs lengthen progressively. It runs smoothly with extra long, loping strides.'),
(107, 'Hitmonchan', 7, NULL, 4, 7, 110.7, 'While apparently doing nothing, it fires punches in lightning-fast volleys that are impossible to see.'),
(108, 'Lickitung', 1, NULL, 3, 11, 144.4, 'Its tongue can be extended like a chameleon''s. It leaves a tingling sensation when it licks enemies.'),
(109, 'Koffing', 8, NULL, 2, 0, 2.2, 'Because it stores several kinds of toxic gases in its body, it is prone to exploding without warning.'),
(110, 'Weezing', 8, NULL, 3, 11, 20.9, 'Where two kinds of poison gases meet, two Koffing can fuse into a Weezing over many years.'),
(111, 'Rhyhorn', 9, 13, 3, 3, 253.5, 'Its massive bones are 1,000 times harder than human bones. It can easily knock a trailer flying.'),
(112, 'Rhydon', 9, 13, 6, 3, 264.6, 'Protected by an armor-like hide, it is capable of living in molten lava of 3,600 degrees Fahrenheit.'),
(113, 'Chansey', 1, NULL, 3, 7, 76.3, 'A rare and elusive Pokémon that is said to bring happiness to those who manage to get it.'),
(114, 'Tangela', 5, NULL, 3, 3, 77.2, 'The whole body is swathed with wide vines that are similar to seaweed. Its vines shake as it walks.'),
(115, 'Kangaskhan', 1, NULL, 7, 3, 176.4, 'The infant rarely ventures out of its mother''s protective pouch until it is 3 years old.'),
(116, 'Horsea', 3, NULL, 1, 4, 17.6, 'Known to shoot down flying bugs with precision blasts of ink from the surface of the water.'),
(117, 'Seadra', 3, NULL, 3, 11, 55.1, 'Capable of swimming backwards by rapidly flapping its wing-like pectoral fins and stout tail.'),
(118, 'Goldeen', 3, NULL, 2, 0, 33.1, 'Its tail fin billows like an elegant ballroom dress, giving it the nickname of the Water Queen.'),
(119, 'Seaking', 3, NULL, 4, 3, 86.0, 'In the autumn, its body becomes more fatty in preparing to propose to a mate. It takes on beautiful colors.'),
(120, 'Staryu', 3, NULL, 2, 7, 76.1, 'An enigmatic Pokémon that can effortlessly regenerate any appendage it loses in battle.'),
(121, 'Starmie', 3, 11, 3, 7, 176.4, 'Its central core glows with the seven colors of the rainbow. Some people value the core as a gem.'),
(122, 'Mr. Mime', 11, 18, 4, 3, 120.2, 'If interrupted while it is miming, it will slap around the offender with its broad hands.'),
(123, 'Scyther', 12, 10, 4, 11, 123.5, 'With ninja-like agility and speed, it can create the illusion that there are more than one.'),
(124, 'Jynx', 11, 6, 4, 7, 89.5, 'It seductively wiggles its hips as it walks. It can cause people to dance in unison with it.'),
(125, 'Electabuzz', 4, NULL, 3, 7, 66.1, 'Normally found near power plants, they can wander away and cause major blackouts in cities.');



-- 126 through 151
INSERT INTO Pokemon_Master (master_id, species, type1, type2, feet, inches, weight, pokedex_ent) VALUES
(126, 'Magmar', 2, NULL, 4, 3, 98.1, 'Its body always burns with an orange glow that enables it to hide perfectly among flames.'),
(127, 'Pinsir', 12, NULL, 4, 11, 121.3, 'If it fails to crush the victim in its pincers, it will swing it around and toss it hard.'),
(128, 'Tauros', 1, NULL, 4, 7, 194.9, 'When it targets an enemy, it charges furiously while whipping its body with its long tails.'),
(129, 'Magikarp', 3, NULL, 2, 11, 22.0, 'In the distant past, it was somewhat stronger than the horribly weak descendants that exist today.'),
(130, 'Gyarados', 3, 10, 21, 4, 518.1, 'Rarely seen in the wild. Huge and vicious, it is capable of destroying entire cities in a rage.'),
(131, 'Lapras', 3, 10, 8, 2, 485.0, 'A Pokémon that has been overhunted almost to extinction. It can ferry people across the water.'),
(132, 'Ditto', 1, NULL, 1, 0, 8.8, 'Capable of copying an opponent''s genetic code to instantly transform itself into a duplicate of the enemy.'),
(133, 'Eevee', 1, NULL, 1, 0, 14.3, 'Its genetic code is irregular. It may mutate if it is exposed to radiation from element stones.'),
(134, 'Vaporeon', 3, NULL, 3, 3, 63.9, 'Lives close to water. Its long tail is ridged with a fin which is often mistaken for a mermaid''s.'),
(135, 'Jolteon', 4, NULL, 2, 7, 54.0, 'It accumulates negative ions in the atmosphere to blast out 10,000-volt lightning bolts.'),
(136, 'Flareon', 2, NULL, 2, 11, 55.1, 'When storing thermal energy in its body, its temperature can soar to over 1,600 degrees Fahrenheit.'),
(137, 'Porygon', 1, NULL, 2, 7, 80.5, 'A man-made Pokémon that came about as a result of research. It is programmed with only basic motions.'),
(138, 'Omanyte', 3, 13, 1, 4, 16.5, 'Although long extinct, in rare cases, it can be genetically resurrected from fossils.'),
(139, 'Omastar', 3, 13, 3, 3, 77.2, 'A prehistoric Pokémon that died out when its heavy shell made it impossible to catch prey.'),
(140, 'Kabuto', 9, 13, 1, 8, 25.4, 'A Pokémon that was resurrected from a fossil found in what was once the ocean floor eons ago.'),
(141, 'Kabutops', 9, 13, 4, 3, 89.3, 'Its sleek shape is perfect for swimming. It slashes prey with its claws and drains the body fluids.'),
(142, 'Aerodactyl', 10, 13, 5, 11, 130.1, 'A ferocious, prehistoric Pokémon that goes for the enemy''s throat with its serrated, saw-like fangs.'),
(143, 'Snorlax', 1, NULL, 6, 11, 1014.1, 'Very lazy. Just eats and sleeps. As its rotund bulk builds, it becomes steadily more slothful.'),
(144, 'Articuno', 6, 10, 5, 7, 122.1, 'A legendary bird Pokémon that is said to appear to doomed people who are lost in icy mountains.'),
(145, 'Zapdos', 4, 10, 5, 3, 116.0, 'A legendary Pokémon that is said to appear from clouds while dropping enormous lightning bolts.'),
(146, 'Moltres', 2, 10, 6, 7, 132.3, 'Known as the legendary bird of fire. Every flap of its wings creates a dazzling flare of flames.'),
(147, 'Dratini', 15, NULL, 5, 11, 7.3, 'Long considered a mythical Pokémon until recently when a small colony was found living underwater.'),
(148, 'Dragonair', 15, NULL, 13, 1, 36.4, 'A mystical Pokémon that exudes a gentle aura. It is said to have the ability to change the weather.'),
(149, 'Dragonite', 15, 10, 7, 3, 463.0, 'An extremely rarely seen marine Pokémon. Its intelligence is said to match that of humans.'),
(150, 'Mewtwo', 11, NULL, 6, 7, 269.0, 'It was created by a scientist after years of horrific gene splicing and DNA engineering experiments.'),
(151, 'Mew', 11, NULL, 1, 4, 8.8, 'So rare that it is still said to be a mirage by many experts. Only a few people have seen it worldwide.');

ALTER TABLE pokemon_master
ADD CONSTRAINT fk_type1 FOREIGN KEY (type1) REFERENCES Pokemon_Type(type_id),
ADD CONSTRAINT fk_type2 FOREIGN KEY (type2) REFERENCES Pokemon_Type(type_id);


-- creating pokemon data table, with integers from master and type table filled in
CREATE TABLE pokemon_data AS
SELECT 
    pm.master_id,					-- select master id from master table
    pm.species,						-- select species id from master table
    pt1.typing AS type1,            -- select the first instance of the type_id table as pt1 since it is aliased as pt1 in the join
    pt2.typing AS type2,            -- select the second instance of the type_id table as pt2, they are difference since we are calling the table twice and sql needs to tell the difference on which table we are referring to
    pm.feet,						-- select feet from master table
    pm.inches,						-- select inches from the master table
    pm.weight,						-- select weight from the master table
    pm.pokedex_ent					-- select the entry from the master table
FROM 
    pokemon_master pm				-- select the master table as the left table and alias it as pm
LEFT JOIN 
    pokemon_type AS pt1 ON pm.type1 = pt1.type_id   
												-- select the type table as the first right table
												-- alias it as pt1 - set type1 of the master table (an integer
												-- to the type id (integer) of the type table
                                                -- since this type table (theres 2) is aliased as pt1, that is how it is
                                                -- referred to in the select statement.
LEFT JOIN 
    pokemon_type AS pt2 ON pm.type2 = pt2.type_id;
												-- this will be the other join used in the table. pokemon type is now refferenced as pt2,
												-- since sql needs to know the difference between the two columns of the end result table.
												-- it is set equal to the master table aliased as pm, pulling from the type2 integer table
SELECT * FROM pokemon_data;