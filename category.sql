-- CREATE TABLE `users` (
--   `id` int(11) NOT NULL,
--   `firstName` varchar(25) NOT NULL,
--   `lastName` varchar(25) NOT NULL,
--   `username` varchar(50) NOT NULL,
--   `email` varchar(100) NOT NULL,
--   `password` varchar(255) NOT NULL,
--   `signUpDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
--   `isSubscribed` tinyint(4) NOT NULL DEFAULT '0'
-- );

-- Create the categories table

CREATE TABLE categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    image_path VARCHAR(255),
    link VARCHAR(255)
);

-- Insert sample categories with entity details
INSERT INTO categories (name, description, image_path, link) VALUES 
('Classic', 'Ben, age 10, finds the Omnitrix on vacation, enabling him to morph into ten aliens, each with unique powers.', './imgs/cl.jpg', './classic.php'),
('Alien Force', 'Ben, 15, with Omnitrix, Gwen, and Kevin, hunts for Grandpa Max. Using 10 new aliens like Swampfire and Jetray, they fight Highbreed to save humanity and Earth.', './imgs/af1.jpg', './alien_force.php'),
('Ultimate Alien', 'A year post-Vilgax defeat, Ben, Gwen, and Kevin, armed with the Ultimatrix, tackle new adventures as skepticism from adults looms.', './imgs/ulti.png', './ultimate_alien.php'),
('Omniverse', 'Ben and Rook explore Undertown, an alien city, facing old enemies seeking revenge.', './imgs/omm.png', './omniverse.php');

CREATE TABLE episodes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES categories(id),
    season INT,
    image_path VARCHAR(255),
    episode_name VARCHAR(100) NOT NULL,
    description VARCHAR(1000),
    release_date VARCHAR(20)

);

INSERT INTO episodes (category_id, season, image_path, episode_name, description, release_date) VALUES
(1, 1, './imgs/classic/s01/s1e1.jpg', 'S01 E01 - And Then There Were 10', 'While on a summer road trip with his Grandpa Max and cousin Gwen, ten-year-old Ben Tennyson finds a mysterious device that allows him to change into ten different alien heroes', '2005-12-27'),
(1, 1, './imgs/classic/s01/s1e2.png', 'S01 E02 - Washington B.C', 'Ben must battle the mad scientist Dr Animo, who plans to destroy Washington D.C. with an invention that can bring dinosaurs to life and turn normal animals into monsters.', '2006-01-13'),
(1, 1, './imgs/classic/s01/s1e3.png', 'S01 E03 - The Krakken', 'Ben encounters a sea monster while camping at the lake with Max and Gwen, but they dont believe him until the Krakken attacks.', '2006-01-14'),
(1, 1, './imgs/classic/s01/s1e4.png', 'S01 E04 - Permanent Retirement', 'Grandpa, Gwen and Ben visit an elderly relative only to find that her retirement community has been overrun by a group of shape-shifting aliens.', '2006-01-21'),
(1, 1, './imgs/classic/s01/s1e5.png', 'S01 E05 - Hunted', 'Ben faces a difficult challenge when Vilgax sends the alien bounty hunters Sixsix, Crab, and Tetrax after him to retrieve the Omnitrix.', '2006-01-28'),
(1, 1, './imgs/classic/s01/s1e6.jpg', 'S01 E06 - Tourist Trap', 'Bens prank backfires when he accidentally releases a Megawhatt, a destructive monster made of electrical energy.', '2006-02-04'),
(1, 1, './imgs/classic/s01/s1e7.jpg', 'S01 E07 - Kevin 11', 'After an argument with Max, Ben leaves for the city on his own and encounters a boy who has the power to absorb energy - and the power of the Omnitrix.', '2006-02-11'),
(1, 1, './imgs/classic/s01/s1e8.jpg', 'S01 E08 - The Alliance', 'Ben discovers that a tough gang leader has merged with parts of Vilgaxs robot drones to become an alien cyborg.', '2006-02-18'),
(1, 1, './imgs/classic/s01/s1e9.jpg', 'S01 E09 - Last Laugh', 'Ben must overcome his deathly fear of clowns when Gwen is kidnapped by the ringmaster at an evil circus.', '2006-02-25'),
(1, 1, './imgs/classic/s01/s1e10.jpg', 'S01 E10 - Lodes Lwcus', 'Ben defeats a magician whose power comes from mystical charms. However, when Gwen finds one of his charms, she develops amazing luck in battle, at the expense of Ben.', '2006-03-04'),
(1, 1, './imgs/classic/s01/s1e11.jpg', 'S01 E11 - A Small Problem', 'Ben changes into an alien form to ride a roller-coaster. However, he gets stuck as Greymatter and finds himself captured by a sci-fi geek.', '2006-03-11'),
(1, 1, './imgs/classic/s01/s1e12.jpg', 'S01 E12 - Moddion Melys', 'Bens summer cold causes strange side effects in his alien forms while he tries to deal with a cockroach monster.', '2006-03-18'),
(1, 1, './imgs/classic/s01/s1e13.jpg', 'S01 E13 - Secrets', 'Healed from his injuries and enhanced, Vilgax decides to go after the Omnitrix prototype himself, instead of relying on mercenaries and subordinates.', '2006-03-25');

-- Insert sample episodes for Classic category, season 2
INSERT INTO episodes (category_id, season, image_path, episode_name, description, release_date) VALUES
(1, 2, './imgs/classic/s02/s2e1.png', 'S01 E01 - Truth', 'After the battle with Vilgax, Grandpa Max tells Ben and Gwen about his secret past tracking extra-terrestrials for the government.', '29 May 2006'),
(1, 2, './imgs/classic/s02/s2e2.png', 'S01 E02 - Big Tick', 'A plant-sucking alien who wants to destroy the world arrives in Yellowstone National Park, thinking that it would be a good place to start.', '30 May 2006'),
(1, 2, './imgs/classic/s02/s2e3.png', 'S01 E03 - Framed', 'Kevin 11 is back for revenge on Ben 10, and he has an all new weapon in tow. Kevin can now change into several of Bens alien personas.', '31 May 2006'),
(1, 2, './imgs/classic/s02/s2e4.png', 'S01 E04 - Gwen 10', 'Ben is in trouble when Gwen receives the Omnitrix, as she also receives all of the powers that go along with it.', '1 Jun 2006'),
(1, 2, './imgs/classic/s02/s2e5.png', 'S01 E05 - Grudge Match', 'Ben is transferred to a space ship, but he is shackled to Kevin 11. They have to try and work together to get back home.', '7 Jun 2006'),
(1, 2, './imgs/classic/s02/s2e6.png', 'S01 E06 - The Galactic Enforcers', 'Ben joins forces with a group of alien super heroes to combat plans by two bounty hunters to build a bomb that is powerful enough to destroy the galaxy.', '13 Jun 2006'),
(1, 2, './imgs/classic/s02/s2e7.png', 'S01 E07 - Camp Fear', 'Max nearly runs over a summer camp attendee who has decided to run away. The boys agree to take him back to camp.', '21 Jun 2006'),
(1, 2, './imgs/classic/s02/s2e8.png', 'S01 E08 - The Ultimate Weapon', 'Max finds out that part of an alien weapon was discovered in Texas, and he wont rest until he has found it himself.', '6 Jul 2006'),
(1, 2, './imgs/classic/s02/s2e9.png', 'S01 E09 - Tough Luck', 'Gwens lucky powers come back to her when she inadvertently picks up the legendary Keystone of Bazell. However, Hex and his niece are also after the talisman.', '12 Jul 2006'),
(1, 2, './imgs/classic/s02/s2e10.png', 'S01 E10 - They Lurk Below', 'Ben and Gwen come face-to-face with mysterious creatures determined to destroy the underwater resort owned by Grandpa Maxs old friend.', '18 Jul 2006'),
(1, 2, './imgs/classic/s02/s2e11.png', 'S01 E11 - Ghostfreaked Out', 'Ghostfreak frees himself from Bens watch and becomes a fully fledged being. Realising that he needs Bens DNA to survive, he plans to merge them both together.', '25 Jul 2006'),
(1, 2, './imgs/classic/s02/s2e12.png', 'S01 E12 - Dr.Animo and the Mutant Ray', 'Dr Amino has finally broken out of prison, and he is determined to try and find Ben so he can gain his revenge.', '25 Aug 2006'),
(1, 2, './imgs/classic/s02/s2e13.png', 'S01 E13 - Back With a Vengeance', 'Ben has discovered the best secret about the watch and can now change into any alien that he wants to, which is making him cocky.', '9 Oct 2006');

INSERT INTO episodes (category_id, season, image_path, episode_name, description, release_date) VALUES
(1, 3, './imgs/classic/s03/s3e1.png', 'S03 E01 . Ben 10,000', 'Gwen is abducted by her future self to help future Ben reconnect with his family and defeat Dr Animos latest plan to revive Vilgax.', '25 Nov 2006'),
(1, 3, './imgs/classic/s03/s3e2.png', 'S03 E02 . Back With a Vengeance; Midnight Madness Part 1', 'The Rustbucket breaks down in front of Americas largest mall, so Gwen and Ben decide to explore, but they could be in for more trouble than they thought.', '2 Dec 2006'),
(1, 3, './imgs/classic/s03/s3e3.png', 'S03 E03 . A Change of Face', 'Ben, Gwen and Max face off against Charmcaster in Salem, Massachusetts, when he tries to swap souls with Ben and gain control of the Omnitrix.', '9 Dec 2006'),
(1, 3, './imgs/classic/s03/s3e4.png', 'S03 E04 . Merry Christmas', 'The Rustbucket breaks down in the middle of the desert, leaving Ben, Gwen, and Max to take refuge in a bizarre Christmas theme park run by the mysterious Mr Jingles.', '11 Dec 2006'),
(1, 3, './imgs/classic/s03/s3e5.png', 'S03 E05 . Ben Wolf', 'Ben is confronted by a Navajo Werewolf while visiting Grandpa Max old friend in New Mexico. However, he is scarred during the battle which causes some alarming changes.', '17 Feb 2007'),
(1, 3, './imgs/classic/s03/s3e6.png', 'S03 E06 . Game Over', 'Ben and Gwen are zapped into a video game. Their only chance of escape is to complete the game, while a sinister alien also tries to leave the computer world behind.', '24 Feb 2007'),
(1, 3, './imgs/classic/s03/s3e7.png', 'S03 E07 . Super Alien Hero Buddy Adventures', 'Ben discovers that his aliens are the stars of a new cartoon series and his favourite action hero cartoon has been axed. Something is not right.', '10 Mar 2007'),
(1, 3, './imgs/classic/s03/s3e8.png', 'S03 E08 . Underwraps', 'Grandpa Max takes Ben and Gwen to a farm to show them the meaning of hard work. However, they discover that an alien has arrived to steal a rare and dangerous crystal.', '10 Mar 2007'),
(1, 3, './imgs/classic/s03/s3e9.png', 'S03 E09 . The Unnaturals', 'Ben attends the Little League World Series to cheer his home team, but quickly discovers that their opponents are robots posing as kids and have a sinister plan.', '17 Mar 2007'),
(1, 3, './imgs/classic/s03/s3e10.png', 'S03 E10 . Game Over; Monster Weather Part 2', 'Max brings the kids to a huge music festival while a crazed weatherman plans to use his weather-predicting robot to change the weather and advance his career.', '24 Mar 2007'),
(1, 3, './imgs/classic/s03/s3e11.png', 'S03 E11 . The Return', 'The latest shuttle launch is seemingly delayed by a purple lightning storm, so Ben, Gwen and Max set out to discover what really happened.', '7 Apr 2007'),
(1, 3, './imgs/classic/s03/s3e12.png', 'S03 E12 . Be Afraid of the Dark', 'Ben goes into space with Gwen and Max to stop Ghostfreak from making the world dark. They also manage to beat the Mummy, Frankenstein and Werewolf.', '14 Apr 2007'),
(1, 3, './imgs/classic/s03/s3e13.png', 'S03 E13 . The Visitor', 'Xylene, an alien who once had a relationship with Max, suddenly appears, Ben and Gwen are suspicious as to her true motives. Also, Vilgax plans his next robot drone attack.', '21 Apr 2007');

INSERT INTO episodes (category_id, season, image_path, episode_name, description, release_date) VALUES
(1, 4, './imgs/classic/s04/s4e1.png','S04 E01 . Perfect Day','Ben is put into a dream world by Enoch and the Forever Knights where hes tricked into having a perfect day, but soon it turns out to be a nightmare.','14 Jul 2007'), 
(1, 4, './imgs/classic/s04/s4e2.png','S04 E02 . Divided We Stand','Ben gets a new Omnitrix hero called Ditto, and he is put to good use against Dr Animo and his multiplying Stinkflies extracted from Dittos DNA.','19 Jul 2007'),  
(1, 4, './imgs/classic/s04/s4e3.png','S04 E03 . Dont Drink the Water','Ben, Gwen and Grandpa are at the fair and stumble across the fountain of youth. However, Hex is hot on their trail.','26 Jul 2007'),  
(1, 4, './imgs/classic/s04/s4e4.png','S04 E04 . Big Fat Alien Wedding','Gwen, Ben and Max attend a wedding where an Alien is marrying a human that is interrupted by a strange alien who turns out to be the brides ex-boyfriend.','2 Aug 2007'),  
(1, 4, './imgs/classic/s04/s4e5.png','S04 E05 . The Secret of the Omnitrix (Part 1)','Part 1 of three. Stubborn Ben runs into trouble fighting Animo.','10 Aug 2007'),  
(1, 4, './imgs/classic/s04/s4e6.png','S04 E06 . Secret of the Omnitrix (Part 2)','Ben 10 runs into trouble fighting against Animo, who uses his latest creations to try and prevail against Ben, inluding a giant mutant hornet.','10 Aug 2007'),  
(1, 4, './imgs/classic/s04/s4e7.png','S04 E07 . The Secret of the Omnitrix (Part 3)','Conclusion. Stubborn Ben runs into trouble fighting against Animo.','10 Aug 2007'),  
(1, 4, './imgs/classic/s04/s4e8.png','S04 E08 . Ken Ten','In the future, Ben Ten Thousand gives his son, Ken, his very own Omnitrix. However, Ken is upset when his dad does not trust him with his new-found power.','6 Oct 2007'),  
(1, 4, './imgs/classic/s04/s4e9.png','S04 E09 . Ben Four Good Buddy','Gwen and Ben are fed up with the Rustbucket and are suddenly chased off the road by a vicious violent road crew who are terrorising the highway.','22 Sept 2007'),  
(1, 4, './imgs/classic/s04/s4e10.png','S04 E10 . Ready to Rumble','Ben uses Fourarms to compete in an ultimate wrestling contest, so he can replace Gwens broken computer with the prize money.','29 Sept 2007'), 
(1, 4, './imgs/classic/s04/s4e11.png','S04 E11 . Ben 10 vs. Negative 10 Pt. 1','Ten of Bens toughest enemies are united by the Forever King, to steal the worlds most powerful energy source and take over the world.','9 Mar 2008'), 
(1, 4, './imgs/classic/s04/s4e12.png','S04 E12 . Ben 10 vs. Negative 10 Pt. 2','Ten of Bens toughest enemies are united by the Forever King, to steal the worlds most powerful energy source and take over the world.','9 Mar 2008'), 
(1, 4, './imgs/classic/s04/s4e13.png','S04 E13 . Goodbye and Good Riddance','After a summer of saving the world, Ben is forced to return to fifth Grade without Grandpa Max and Gwen.','15 Apr 2008');
 -- Continue inserting episodes for season 4 of the Classic category
 INSERT INTO episodes (category_id, season, image_path, episode_name, description, release_date) VALUES
(2, 1, './imgs/Alienforce/s01/s1e1.png','S01 E01 . Ben 10 Returns, Part 1','Its been five years since Ben last used the Omnitrix, but when Grandpa Max disappears, Ben must be a hero again.','18 Apr 2008'),
(2, 1, './imgs/Alienforce/s01/s1e2.png','S01 E02 . Ben 10 Returns, Part 2','Ben, Gwen, and Kevin encounter a strange ship in the middle of the desert. There they find the plots of the Highbreed and the DNAliens.','18 Apr 2008'),
(2, 1, './imgs/Alienforce/s01/s1e3.png','S01 E03 . Everybody Talks About the Weather','Gwen picks up a distress call from Grandpa Maxs Plumber badge and traces its location to an alien weather station thats freezing the planet.','26 Apr 2008'),
(2, 1, './imgs/Alienforce/s01/s1e4.png','S01 E04 . Kevins Big Score','Kevin meets up with an old `friend to get some secret, top-level alien technology, but in doing so, Ben and Gwen think that he has gone back to his bad, old ways.','3 May 2008'),
(2, 1, './imgs/Alienforce/s01/s1e5.png','S01 E05 . All That Glitters','Five years after originally discovering the Omnitrix, Ben Tennyson has returned to normal life. However, he is called back into action when a race of fanatical aliens attack the Earth.','10 May 2008'),
(2, 1, './imgs/Alienforce/s01/s1e6.png','S01 E06 . Max Out','Five years after originally discovering the Omnitrix, Ben Tennyson has returned to normal life. However, he is called back into action when a race of fanatical aliens attack the Earth.','17 May 2008'),
(2, 1, './imgs/Alienforce/s01/s1e7.png','S01 E07 . Pier Pressure','Five years after originally discovering the Omnitrix, Ben Tennyson has returned to normal life. However, he is called back into action when a race of fanatical aliens attack the Earth.','31 May 2008'),
(2, 1, './imgs/Alienforce/s01/s1e8.png','S01 E08 . What Are Little Girls Made Of?','When Gwen meets her grandmother and discovers that she is an Anodite, Gwen realises she has inherited her grandmothers alien powers.','7 Jun 2008'),
(2, 1, './imgs/Alienforce/s01/s1e9.png','S01 E09 . The Gauntlet','Cash the school bully steals Kevins car and wrecks it, but when questioned he challenges Ben to a fight and unleashes his metal glove with laser powers.','14 Jun 2008'),
(2, 1, './imgs/Alienforce/s01/s1e10.png','S01 E10 . Paradox','Ben, Gwen, and Kevin must team up with a time traveling hero to face the unstoppable monster from the 1950s.','5 Jul 2008'),
(2, 1, './imgs/Alienforce/s01/s1e11.png','S01 E11 . Be-Knighted','A dragon escapes the Forever Knights before they get a chance to kill it.','12 Jul 2008'),
(2, 1, './imgs/Alienforce/s01/s1e12.png','S01 E12 . Plumbers Helpers','When young plumbers mistake Ben and the team for dangerous aliens, Kevin is kidnapped.','19 Jul 2008'),
(2, 1, './imgs/Alienforce/s01/s1e13.png','S01 E13 . X = Ben + 2','While trying to save Earth from the destructive power of Milleous, Alien X sends Ben into a scientific world of debate, deliberation and delay.','31 Aug 2008');
 -- Continue inserting episodes for season 1 of the Alienforce category

-- Insert sample episodes for Alienforce category, season 2
INSERT INTO episodes (category_id, season, image_path, episode_name, description, release_date) VALUES
(2, 2, './imgs/Alienforce/s02/s2e1.png','S02 E01 . Darkstar Rising','Ben impersonates a plumber and is arrested. Highbreed interrupts an intimate moment between Gwen and Kevin. The evil Darkstar takes over Michael Morningstar, captures the group and drains their energy.','10 Oct 2008'),
(2, 2, './imgs/Alienforce/s02/s2e2.png','S02 E02 . Alone Together','During battle, a mishap with a teleport pod sees Ben and a Highbreed commander stranded on a distant world. They must work together to survive the desert planet and return to Earth.','17 Oct 2008'),
(2, 2, './imgs/Alienforce/s02/s2e3.png','S02 E03 . Good Copy, Bad Copy','An alien doppelgänger impersonates Ben and tries to destroy him with the power of his own Omnitrix. Gwen and Kevin use a piece of Bens wreckage to track him.','24 Oct 2008'),
(2, 2, './imgs/Alienforce/s02/s2e4.png','S02 E04 . Save the Last Dance','Ben worries when he slowly starts to lose control of the Omnitrix.','7 Nov 2008'),
(2, 2, './imgs/Alienforce/s02/s2e5.png','S02 E05 . Undercover','Ben and the gang must rescue a child genius from the DNAliens that are forcing him to help build a mysterious arch.','14 Nov 2008'),
(2, 2, './imgs/Alienforce/s02/s2e6.png','S02 E06 . Pet Project','Sir Morton is sent to capture Julies pet `Ship - the Galvin Shape Shifter that can duplicate and take the form of any shape it likes.','21 Nov 2008'),
(2, 2, './imgs/Alienforce/s02/s2e7.png','S02 E07 . Grounded','Ben and Gwen are grounded after Bens parents caught them in the middle of a battle. With the threat of the DNAliens looming, Kevin is left alone to fight them off.','23 Nov 2008'),
(2, 2, './imgs/Alienforce/s02/s2e8.png','S02 E08 . Voided','Ben ventures into the Null Void to help the Plumbers Helpers on a mission to stop DVoid at all costs. They musy void him before its too late.','5 Dec 2008'),
(2, 2, './imgs/Alienforce/s02/s2e9.png','S02 E09 . Inside Man','Ben and his team rescue Tyler, a runaway prisoner of the DNAliens, while trying to stop them from completing the jump gate.','12 Dec 2008'),
(2, 2, './imgs/Alienforce/s02/s2e10.png','S02 E10 . Birds of a Feather','Ben and the gang try to restore Simian, prince of the Arachnachimps, to power.','24 Mar 2009'),
(2, 2, './imgs/Alienforce/s02/s2e11.png','S02 E11 . Unearthed','Ben and the gang try to return a baby monster to its parents before the DNAliens can find it.','25 Mar 2009'),
(2, 2, './imgs/Alienforce/s02/s2e12.png','S02 E12 . War of the Worlds, Part 1','Professor Paradox and Azmath return to Earth to warn Ben about the imminent Hybreed attack.','27 Mar 2009'),
(2, 2, './imgs/Alienforce/s02/s2e13.png','S02 E13 . War of the Worlds, Part 2','Ben, Gwen and Kevin take their fight to the Hybreeds home world, where they have one hour to save the Earth.','27 Mar 2009');
 -- Continue inserting episodes for season 2 of the Alienforce category

-- Insert sample episodes for Alienforce category, season 3
INSERT INTO episodes (category_id, season, image_path, episode_name, description, release_date) VALUES
(2, 3, './imgs/Alienforce/s03/s3e1.png','S03 E01 . Vengeance of Vilgax','Vilgax has conquered the heroes of 10 planets, and challenges Ben to single combat for Earth.','11 Sept 2009'),
(2, 3, './imgs/Alienforce/s03/s3e2.png','S03 E02 . Vengeance of Vilgax, Part 2','Vilgax has conquered the heroes of 10 planets and challenges Ben to single combat for Earth.','11 Sept 2009'),
(2, 3, './imgs/Alienforce/s03/s3e3.png','S03 E03 . Inferno','Ben and the gang discover a secret plot by Vulkanus to plant a bomb in the centre of the Earth. Can Ben, Gwen and Kevin stop Vulkanus from destroying the planet?','18 Sept 2009'),
(2, 3, './imgs/Alienforce/s03/s3e4.png','S03 E04 . Fools Gold','Ben, Gwen and Kevin must come to the rescue when a teenage alien goes missing while on a trip to Earth.','25 Sept 2009'),
(2, 3, './imgs/Alienforce/s03/s3e5.png','S03 E05 . Simple','When a small girl named Proberty sends them a request for help, Ben, Gwen and Kevin travel to another planet to try and prevent a full scale war.','9 Oct 2009'),
(2, 3, './imgs/Alienforce/s03/s3e6.png','S03 E06 . Dont Fear the Repo','Ben and Kevin travel to the far side of the Galaxy to stop a judge from repossessing their ship. While back on earth, Gwen and Julie face their own battle.','16 Oct 2009'),
(2, 3, './imgs/Alienforce/s03/s3e7.png','S03 E07 . Singlehanded','When Sunder the Retriever attempts to take the Omnitrix from Bens hand, our hero is transported to the Null Void - while his hand remains on Earth.','23 Oct 2009'),
(2, 3, './imgs/Alienforce/s03/s3e8.png','S03 E08 . If All Else Fails','Ben faces one of his toughest opponents yet when an unexpected earthquake awakens a Highbreed officer intent on using a weapon to destroy the world.','6 Nov 2009'),
(2, 3, './imgs/Alienforce/s03/s3e9.png','S03 E09 . In Charms Way','Charmcaster returns to exact revenge on Ben and Gwen and has a cunning plan to manipulate Kevin into doing the dirty work.','13 Nov 2009'),
(2, 3, './imgs/Alienforce/s03/s3e10.png','S03 E10 . Ghost Town','When Ghostfreak betrays him and turns his people against him, Vilgax comes to earth and asks for help from an unlikely source.','20 Nov 2009'),
(2, 3, './imgs/Alienforce/s03/s3e11.png','S03 E11 . Trade Off','Desperate to return to his former self, Kevin makes a costly deal with Darkstar to recover an important artifact.','4 Dec 2009'),
(2, 3, './imgs/Alienforce/s03/s3e12.png','S03 E12 . Busy Box','Ben and Gwen find an alien box with a special power - it can transform into anything it sees! However, the gang face a fight when the Vreedle brothers find out about it.','11 Dec 2009'),
(2, 3, './imgs/Alienforce/s03/s3e13.png','S03 E13 . Con of Rath','When Ben is asked to make a delivery to Jarret, the Omnitrix malfunctions and turns Ben into Rath, an angry alien who wants to fight everyone.','8 Jan 2010'),
(2, 3, './imgs/Alienforce/s03/s3e14.png','S03 E14 . Primus','When Ben and the gang are teleported to a distant planet, they discover the power source of the Omnitrix, but they also find Vilgax.','15 Jan 2010'),
(2, 3, './imgs/Alienforce/s03/s3e15.png','S03 E15 . Time Heals','Gwen ignores the warnings from Professor Paradox and travels back in time to try and save Kevin from transforming into a monster.','22 Jan 2010'),
(2, 3, './imgs/Alienforce/s03/s3e16.png','S03 E16 . The Secret of Chromastone','Ben faces a tough fight against Vilgax and Tetrax when they both show up and demand that Ben gives them Cromastone.','29 Jan 2010'),
(2, 3, './imgs/Alienforce/s03/s3e17.png','S03 E17 . Above and Beyond','Grandpa Max is forced to call on The Plumbers Helpers when he is trapped aboard an abandoned space station on a collision course with Earth.','5 Feb 2010'),
(2, 3, './imgs/Alienforce/s03/s3e18.png','S03 E18 . Vendetta','While Ben and Gwen go looking to find out who ransacked Kevins house, they come across Ragnarok, a dangerous, escaped criminal from the Null Void.','12 Feb 2010'),
(2, 3, './imgs/Alienforce/s03/s3e19.png','S03 E19 . The Final Battle, Part 1','Albedo has taken the Ultimatrix from Azmuth and has used it to kidnap Gwen and Kevin. Ben goes to face off with Albedo and rescue his friends when he quickly discovers that Albedo has been working with Vilgax.','26 Mar 2010'),
(2, 3, './imgs/Alienforce/s03/s3e20.png','S03 E20 . The Final Battle, Part 2','Ben and his team escape from Vilgaxs clutches. Although he is fearful of the power of the Omnitrix, Ben confronts Vilgax onboard his ship in order to prevent the invasion of Earth.','26 Mar 2010');
 -- Continue inserting episodes for season 3 of the Alienforce category

-- Insert sample episodes for UltimateAlien category, season 1
INSERT INTO episodes (category_id, season, image_path, episode_name, description, release_date) VALUES
(3, 1, './imgs/UltimateAlien/s01/s1e1.png','S01 E01 . Fame','Footage of Ben as an alien is leaked to the public, causing a media frenzy right outside his door. His secret identity now revealed, Ben has to face both the music and an impending alien threat ready to attack the gang.','23 Apr 2010'),
(3, 1, './imgs/UltimateAlien/s01/s1e2.png','S01 E02 . Duped','Ben has a case to solve, his girlfriends tennis game to watch, and he wants to see a movie, but he only has time for one - so he decides to enlist the help of Echo.','30 Apr 2010'),
(3, 1, './imgs/UltimateAlien/s01/s1e3.png','S01 E03 . Hit Em Where They Live','Zambozo the Clown and his band of cronies set a trap for Ben, using his family as bait. Can Ben, Kevin and Gwen track them down before its too late?','7 May 2010'),
(3, 1, './imgs/UltimateAlien/s01/s1e4.png','S01 E04 . Computer Games','Ben is excited when he gets the chance to star in his own video game. But he soon realises that all is not as it seems when a TV news reader gets involved.','14 May 2010'),
(3, 1, './imgs/UltimateAlien/s01/s1e5.png','S01 E05 . Escape From Aggregor','Ben and the gang must come to the rescue of Galapagos, a giant, peaceful turtle who has been thrown in jail by the evil Aggregor.','21 May 2010'),
(3, 1, './imgs/UltimateAlien/s01/s1e6.png','S01 E06 . Too Hot to Handle','Ben and the gang investigate an alien on the run from Aggregor, but theres a problem: hes trapped in armour containing a dangerous level of radiation.','28 May 2010'),
(3, 1, './imgs/UltimateAlien/s01/s1e7.png','S01 E07 . Andreas Fault','With the help of Andreas, Argit has become the new leader of the Forever Knights, but when the knights turn on their new leader Ben must come to Andreas rescue.','4 Jun 2010'),
(3, 1, './imgs/UltimateAlien/s01/s1e8.png','S01 E08 . Fused','After ambushing Ben at his house, Raad causes the Ultimatrix to malfunction and deactivate itself. Ben must get his new tool working again, before its too late.','11 Jun 2010'),
(3, 1, './imgs/UltimateAlien/s01/s1e9.png','S01 E09 . Hero Time','When an actress is kidnapped at a film premiere and held for ransom, Ben steps in to save the day, but when the press get a hold of the story Captain Nemesis is unhappy!','18 Jun 2010'),
(3, 1, './imgs/UltimateAlien/s01/s1e10.png','S01 E10 . Ultimate Aggregor','Aggregor has plans to become invincible by controlling an abandoned time machine, can Ben and the gang stop him from absorbing its energy before its too late?','10 Oct 2010'),
(3, 1, './imgs/UltimateAlien/s01/s1e11.png','S01 E11 . Map of Infinity','With Aggregor newly transformed and very dangerous, Ben 10 and the gang must track down the first part of the Map of Infinity to a half-frozen, half-molten planet.','10 Oct 2010'),
(3, 1, './imgs/UltimateAlien/s01/s1e12.png','S01 E12 . Reflected Glory','Cash and JT take credit for Ben 10s heroism and get a TV show tagging along on Bens adventures. Unfortunately, Psyphon believes them and plans to kill them.','15 Oct 2010'),
(3, 1, './imgs/UltimateAlien/s01/s1e13.png','S01 E13 . Deep','After closing in on Aggregor, Ben and his friends suddenly wind up in a magical dimension where they must reluctantly team up with their nemesis, Charmcaster, for help.','29 Oct 2010'),
(3, 1, './imgs/UltimateAlien/s01/s1e14.png','S01 E14 . Where the Magic Happens','After closing in on Aggregor, Ben and his friends suddenly wind up in a magical dimension where they must reluctantly team up with their nemesis, Charmcaster, for help.','29 Oct 2010'),
(3, 1, './imgs/UltimateAlien/s01/s1e15.png','S01 E15 . Perplexahedron','Aggregor almost has the fourth piece of the Map of Infinity and the gang have tracked him to a artificial, cube shaped planet known as Perplexahedron.','5 Nov 2010'),
(3, 1, './imgs/UltimateAlien/s01/s1e16.png','S01 E16 . The Forge of Creation','Ben and his friends have defeated Aggressor, but Kevins personality has been completely altered. The map of infinity falls into someone elses hands, but Ben is confident enough to stop them. Features classic Ben Tennyson.','12 Nov 2010'),
(3, 1, './imgs/UltimateAlien/s01/s1e17.png','S01 E17 . Nor Iron Bars a Cage','Ben and Gwen travel to the Null Void to stop Kevins wild revenge spree, but worry their friendship will not be enough to stop him.','19 Nov 2010'),
(3, 1, './imgs/UltimateAlien/s01/s1e18.png','S01 E18 . The Enemy of My Enemy','Ben and Gwen help Argit by taking him to safety in the galactic plumbers school. However, Argit and the Vreedle Brothers have another idea.','3 Dec 2010'),
(3, 1, './imgs/UltimateAlien/s01/s1e19.png','S01 E19 . Absolute Power','Kevin gains intimidating powers when he absorbs them from Alan and the Plumbers helpers. When Ben and Gwen disagree on how to combat his new-found power, Gwen offers a solution: find Darkstar.','10 Dec 2010'),
(3, 1, './imgs/UltimateAlien/s01/s1e20.png','S01 E20 . Absolute Power','Ben takes the fight to Kevin in an attempt to delay him so that Darkstar and Cooper can complete their machine to restore him to his former shelf.','10 Dec 2010');
 -- Continue inserting episodes for season 1 of the UltimateAlien category

-- Insert sample episodes for UltimateAlien category, season 2
INSERT INTO episodes (category_id, season, image_path, episode_name, description, release_date) VALUES
(3, 2, './imgs/UltimateAlien/s02/s2e1.png','S02 E01 . The Transmogrification of Eunice','The discovery of a lost alien girl without any memory of where she came from leaves the team puzzled, until she reveals magic powers.','4 Feb 2011'),
(3, 2, './imgs/UltimateAlien/s02/s2e2.png','S02 E02 . Eye of the Beholder','Baz-L is kidnapped and the team set out to rescue him. Also, Ben discovers the theft of valuable gems may be related to statues which spring to life and attack.','11 Feb 2011'),
(3, 2, './imgs/UltimateAlien/s02/s2e3.png','S02 E03 . Viktor: The Spoils','Zarcovias soldiers find the frozen body of Dr Viktor leading the team to face the possibility of an old enemy returning to haunt them.','18 Feb 2011'),
(3, 2, './imgs/UltimateAlien/s02/s2e4.png','S02 E04 . The Big Story','Jimmy Jones sees a meteor falling and after he is attacked by an alien plant rushes off to make his big story known.','4 Mar 2011'),
(3, 2, './imgs/UltimateAlien/s02/s2e5.png','S02 E05 . Girl Trouble','Gwens cousin is due to meet the team but Gwens excitement quickly turns to fear when she realises her cousin is not quite right.','11 Mar 2011'),
(3, 2, './imgs/UltimateAlien/s02/s2e6.png','S02 E06 . Revenge of the Swarm','Victor Validus attacks Ben and the team fears that this may signal the return of the Hive and its dreaded Queen.','18 Mar 2011'),
(3, 2, './imgs/UltimateAlien/s02/s2e7.png','S02 E07 . The Creature From Beyond','An inter-dimensional portal, opened by the Future Knights, unleashes a monster that sucks the thoughts from humans.','25 Mar 2011'),
(3, 2, './imgs/UltimateAlien/s02/s2e8.png','S02 E08 . Basic Training','The team has yet to complete basic training since they were made plumbers in the field, and so they are forced to return to the plumbers academy.','1 Apr 2011'),
(3, 2, './imgs/UltimateAlien/s02/s2e9.png','S02 E09 . Its Not Easy Being Gwen','Multi-tasker Gwen needs to handle her busy schedule. That means help her mum and Kevin and also save the world from evil.','8 Apr 2011'),
(3, 2, './imgs/UltimateAlien/s02/s2e10.png','S02 E10 . Ben 10,000 Returns','Ben from the future accidentally causes a time paradox and now Eon has returned to hunt Ben, and every version of Ben, across space and time.','15 Apr 2011'),
(3, 2, './imgs/UltimateAlien/s02/s2e11.png','S02 E11 . Moon Struck','Ben and Gwen hear about how Grandpa Max met their Grandmother Verdona and how he became a member of the intergalactic police force, the plumbers.','22 Apr 2011'),
(3, 2, './imgs/UltimateAlien/s02/s2e12.png','S02 E12 . Prisoner 775 Is Missing','The team learns that Area 51 held hundreds of possibly dangerous aliens and discover that one has escaped. Is the world in danger?','29 Apr 2011');
 -- Continue inserting episodes for season 2 of the UltimateAlien category

-- Insert sample episodes for UltimateAlien category, season 3
INSERT INTO episodes (category_id, season, image_path, episode_name, description, release_date) VALUES
(3, 3, './imgs/UltimateAlien/s03/s3e1.png','S03 E01 . The Purge','Once more, Old George brings the Forever Knights together, but this time he is declaring a war against all aliens on Earth.','16 Sept 2011'),
(3, 3, './imgs/UltimateAlien/s03/s3e2.png','S03 E02 . Simian Says','Ben, Kevin and Gwen must fight a Xenocyte Queen and an evil chimp trying to take over the Arachnichimps home planet.','23 Sept 2011'),
(3, 3, './imgs/UltimateAlien/s03/s3e3.png','S03 E03 . Greetings From Techadon','Ben is in serious trouble when Vulkanus sends Techadon robots to destroy him, so he must use his brains and the help of Gwen and Kevin to beat them all.','30 Sept 2011'),
(3, 3, './imgs/UltimateAlien/s03/s3e4.png','S03 E04 . The Flame Keepers Circle','Julie wants Ben to join her new group but he discovers all is not as it seems and that a villain is behind the fanatical gathering.','7 Oct 2011'),
(3, 3, './imgs/UltimateAlien/s03/s3e5.png','S03 E05 . Double or Nothing','When hearing about a Ben 10 Live theatre show with real aliens, a very angry Ben, together with Gwen and Kevin, goes to find out who is behind it.','14 Oct 2011'),
(3, 3, './imgs/UltimateAlien/s03/s3e6.png','S03 E06 . The Perfect Girlfriend','Julie doesnt seem to be herself so the gang tries to get to the bottom of the mystery while hunting Ssserpent.','21 Oct 2011'),
(3, 3, './imgs/UltimateAlien/s03/s3e7.png','S03 E07 . The Ultimate Sacrifice','The six ultimate forms inside Bens Ultimatrix try to escape but end up trapping Ben into the device and now Gwen and Kevin must figure out how to save Ben.','28 Oct 2011'),
(3, 3, './imgs/UltimateAlien/s03/s3e8.png','S03 E08 . The Widening Gyre','Col Rozum asks the gang for help as people have gone missing in the Pacific, so they head on to the Garbage Vortex, fighting giant seagulls and a trash monster.','4 Nov 2011'),
(3, 3, './imgs/UltimateAlien/s03/s3e9.png','S03 E09 . The Mother of All Vreedles','Bens help is called as raging mad Ma Vreedle heads to Earth planning to kill everyone in order to generate billions of her Vreedle clones!','18 Nov 2011'),
(3, 3, './imgs/UltimateAlien/s03/s3e10.png','S03 E10 . A Knight to Remember','Vilgax and the Flame Keepers Circle are battling the Forever Knights in order to find the heart of Diagon and rule the whole universe.','2 Dec 2011'),
(3, 3, './imgs/UltimateAlien/s03/s3e11.png','S03 E11 . Solitary Alignment','George possesses a powerful sword and plans on murdering his arch-enemy Diagon. However Azmuth knows the swords story and asks Ben, Gwen and Kevin to stop him.','9 Dec 2011'),
(3, 3, './imgs/UltimateAlien/s03/s3e12.png','S03 E12 . Inspector No. 13','A mysterious Techadon master arrives on Earth and captures Ben in order to get the Ultimatrix so he can power his army. Will Gwen and Kevin be able to save Ben?','4 Feb 2012'),
(3, 3, './imgs/UltimateAlien/s03/s3e13.png','S03 E13 . The Enemy of My Frenemy','Gwen asks the team to help her rescue Charmcaster so that they can defeat Adwaita, but Kevin reminds them of the dangers Charmcaster can pose.','11 Feb 2012'),
(3, 3, './imgs/UltimateAlien/s03/s3e14.png','S03 E14 . Couples Retreat','Darkstar romances Charmcaster, taking advantage of her magical strength and energy to absorb all the mystical mana from Ledgerdomain. Gwen and Kevin argue over the protection of a spellbook.','18 Feb 2012'),
(3, 3, './imgs/UltimateAlien/s03/s3e15.png','S03 E15 . Catch a Falling Star','Carl escapes from prison and changes his appearance to start a new life with Darkstar, but before this he seeks revenge on Ben for wrecking his life.','25 Feb 2012'),
(3, 3, './imgs/UltimateAlien/s03/s3e16.png','S03 E16 . The Eggman Cometh','The cure for climate change is in danger as the weather balloon is a target for destruction by Dr Animo (so his flying reptile-man can invade the planet)!','3 Mar 2012'),
(3, 3, './imgs/UltimateAlien/s03/s3e17.png','S03 E17 . Night of the Living Nightmare','Ben is under attack with Albedo desperate to find the ultimatrix by manipulating Bens thoughts as Baz-L faces an enemy.','10 Mar 2012'),
(3, 3, './imgs/UltimateAlien/s03/s3e18.png','S03 E18 . The Beginning of the End','With Diagons claims to rule over the dimension, Ben finds himself caught up in the fight between him and the Forever Knights.','17 Mar 2012'),
(3, 3, './imgs/UltimateAlien/s03/s3e19.png','S03 E19 . The Ultimate Enemy: Part 1','Dagans arrival approaches and the gang must try to stop him, but they have to get past Vilgax first! With Ben busy with Dagan, Vilgax starts his evil universal domination.','24 Mar 2012'),
(3, 3, './imgs/UltimateAlien/s03/s3e20.png','S03 E20 . The Ultimate Enemy: Part 2','Vilgax tries to enforce his sinister plans for universal takeover, while Ben is preoccupied with fighting Dagan.','31 Mar 2012');
 -- Continue inserting episodes for season 2 of the UltimateAlien category

-- Insert sample episodes for Omniverse category, season 1
INSERT INTO episodes (category_id, season, image_path, episode_name, description, release_date) VALUES
(4, 1, './imgs/Omniverse/s01/s1e1.png','S01 E01 . The More Things Change','Bens life suddenly changes when he learns that Gwen wants to continue studying. Kevin wants to stay close to her, so Ben is on his own from now on. Hes a lone fighter until Grandpa Max sends him a new partner.','1 Aug 2012'),

(4, 1, './imgs/Omniverse/s01/s1e2.png','S01 E02 . The More Things Change','Ben and Rook find a whole alien village under the surface and three alien hoods lead him directly to the kingpin of the underground.','1 Aug 2012'),

(4, 1, './imgs/Omniverse/s01/s1e3.png','S01 E03 . A Jolt from the Past','','15 Mar 2023'),
(4, 1, './imgs/Omniverse/s01/s1e4.png','S01 E04 . Trouble Helix','Ben 10 has a problem with a malfunctioning Omnitrix, leaving him trapped as a different alien every week.','6 Oct 2012'),
(4, 1, './imgs/Omniverse/s01/s1e5.png','S01 E05 . Have I Got a Deal for You','Ben and Rook must do everything they can to save the city from an alien. A huge alien wants to completely destroy Bellwood but it seems to be blinded with anger. Ben needs to find a way to contact the alien.','13 Oct 2012'),
(4, 1, './imgs/Omniverse/s01/s1e6.png','S01 E06 . It Was Them','Ben and Rook face a new problem because Dr Animo has escaped from prison. The friends have to find him quickly, because the villain has another nasty plan with which he wants to change evolution on earth.','20 Oct 2012'),
(4, 1, './imgs/Omniverse/s01/s1e7.png','S01 E07 . So Long and Thanks for All the Smoothies','Young Ben, Gwen, and Grandpa Max visit Azmuth on Galvan Prime where they have their first encounter with Malware.','27 Oct 2012'),
(4, 1, './imgs/Omniverse/s01/s1e8.png','S01 E08 . Hot Stretch','Following a robbery in a laboratory, Ben and Rook take over from the municipal police and set out in pursuit of the thief who is in fact Ester. She leads them into underground galleries.','3 Nov 2012'),
(4, 1, './imgs/Omniverse/s01/s1e9.png','S01 E09 . Of Predators and Prey','Ben and Rook had an argument and decided to split up. Then, Ben is captured by Khybe. who it turn out have been after Ben for a long time and now finally has a good opportunity to overpower him.','10 Nov 2012'),
(4, 1, './imgs/Omniverse/s01/s1e10.png','S01 E10 . Of Predators and Prey','While trapped in Khybers ship, Ben learns details about the origin of the Nemetrix, and the link between Khyber, Malware, and Dr Psychobos.','17 Nov 2012');
 -- Continue inserting episodes for season 1 of the Omniverse category

-- Insert sample episodes for Omniverse category, season 2
INSERT INTO episodes (category_id, season, image_path, episode_name, description, release_date) VALUES
(4, 2, './imgs/Omniverse/s02/s2e1.png','S02 E01 . Outbreak','When Dr Psychobos steals a part out of the Omnitrix, causing chaotic side-effects, its up to Ben, Rook, and a small team of Plumbers get everything back to normal.','24 Nov 2012'),
(4, 2, './imgs/Omniverse/s02/s2e2.png','S02 E02 . Many Happy Returns','Kevin is looking to escape from his alien fiancee, Luma, who he promised himself to in exchange for some alien tech years before.','1 Dec 2012'),
(4, 2, './imgs/Omniverse/s02/s2e3.png','S02 E03 . Gone Fishin?','A fishing trip in Undertown takes a bizarre twist as Ben, Rook and Grandpa Max search for a ship-bottling alien pirate.','8 Dec 2012'),
(4, 2, './imgs/Omniverse/s02/s2e4.png','S02 E04 . Blukic and Driba Go to Mr. Smoothys','The Plumbers resident geniuses, Blukic and Driba set off to find some smoothies meanwhile Ben and Rook protect the source of absolute power.','15 Dec 2012'),
(4, 2, './imgs/Omniverse/s02/s2e5.png','S02 E05 . Malefactor','A dog attacks Ben and Rook while theyre at the Olde Bellwood Days festival, but does the owner have other plans? Introducing the new Nemetrix alien, Hypnotick.','22 Dec 2012'),
(4, 2, './imgs/Omniverse/s02/s2e6.png','S02 E06 . Arrested Development','Ben and Rook fight against robots who want to annihilate the Earth. Thats when a kid comes to them. His name is Billy Billions and he was in the same class as Ben when they were little.','5 Jan 2013'),
(4, 2, './imgs/Omniverse/s02/s2e7.png','S02 E07 . Bros in Space','Ben goes to Rooks home planet to meet his family while, unbeknownst to them, an old foe is raising an army to steal the alien worlds most precious resource.','12 Jan 2013'),
(4, 2, './imgs/Omniverse/s02/s2e8.png','S02 E08 . Ben Again','Teen Ben and 11-year-old Ben get their minds switched as part of Eons plot to take over the timeline.','19 Jan 2013'),
(4, 2, './imgs/Omniverse/s02/s2e9.png','S02 E09 . Store 23','While out looking for the elusive 23rd Mr Smoothys store with Blukic and Driba, Ben meets an alternate version of himself.','26 Jan 2013'),
(4, 2, './imgs/Omniverse/s02/s2e10.png','S02 E10 . Special Delivery','As payment for destroying his car, Mr Bowman orders Ben to make deliveries for him without using the Omnitri.','2 Feb 2013');
 -- Continue inserting episodes for season 2 of the Omniverse category

-- Insert sample episodes for Omniverse category, season 3
INSERT INTO episodes (category_id, season, image_path, episode_name, description, release_date) VALUES
(4, 3, './imgs/Omniverse/s03/s3e1.png','S03 E01 . Showdown Part 1','A special group invades the planet Galvan to destroy `Azmuth. The device was once created so that the various creatures can slip into each others skin and thus learn to understand each other.','9 Feb 2013'),
(4, 3, './imgs/Omniverse/s03/s3e2.png','S03 E02 . Showdown Part 2','Knocking down bad guys is just one aspect of being a superhero. With the help of his new partner who is just starting out in the trade, Ben explores the dark side of alien underground life.','16 Feb 2013'),
(4, 3, './imgs/Omniverse/s03/s3e3.png','S03 E03 . Tummy Trouble','When the Gourmand Queen is kidnapped, Ben and Rook must get Gormand military to work together to save her and stop an invasion.','23 Feb 2013'),
(4, 3, './imgs/Omniverse/s03/s3e4.png','S03 E04 . Vilgax Must Croak','Emperor Milleous takes advantage of Vilgaxs absence to attack the planet Vilgaxia. He asks his daughter, Princess Attéa to eliminate Vilgax. The latter is being transferred to a high security prison.','2 Mar 2013'),
(4, 3, './imgs/Omniverse/s03/s3e5.png','S03 E05 . While You Were Away','Psychobos and Princess Attea form an alliance in order to spearhead an invasion of Rooks home planet Revonnah.','9 Mar 2013'),
(4, 3, './imgs/Omniverse/s03/s3e6.png','S03 E06 . The Frogs of War, Part 1','While Ben is missing, the Incurseans take over control of the Earth; Rook and the Plumbers fight back.','16 Mar 2013'),
(4, 3, './imgs/Omniverse/s03/s3e7.png','S03 E07 . The Frogs of War, Part 2','While Ben is missing, the Incurseans take over control of the Earth; Rook and the Plumbers fight back.','16 Mar 2013'),
(4, 3, './imgs/Omniverse/s03/s3e8.png','S03 E08 . Rules of Engagement','Princess Looma makes a surprise return to earth and brings Ben an extremely joyful message: she has decided to marry him. He is confused and tries to get a say in who he will marry.','23 Mar 2013'),
(4, 3, './imgs/Omniverse/s03/s3e9.png','S03 E09 . Rad','After Plumber agents become trapped in Incursean territory, Ben and Rook enlist help from smuggler Rad Dudesman.','30 Mar 2013'),
(4, 3, './imgs/Omniverse/s03/s3e10.png','S03 E10 . Evils Encore','Dr Animo remembers when he took control of the Plumbers HQ in Mount Rushmore. Max, Gwen, and Ben try to thwart his plans.','6 Apr 2013');
 -- Continue inserting episodes for season 3 of the Omniverse category

-- Insert sample episodes for Omniverse category, season 4
INSERT INTO episodes (category_id, season, image_path, episode_name, description, release_date) VALUES
(4, 4, './imgs/Omniverse/s04/s4e1.png','S04 E01 . T.G.I.S','The Secret Saturdays investigate chupacabra attacks in Bellwood to try and figure out what has been going on.','5 Oct 2013'),
(4, 4, './imgs/Omniverse/s04/s4e2.png','S04 E02 . Food Around the Corner','A peace conference is organised between two peoples in conflict. Ben is going to have to be patient, calm, and be very diplomatic to come to an agreement. Unfortunately, a flea invasion will jeopardise this summit.','12 Oct 2013'),
(4, 4, './imgs/Omniverse/s04/s4e3.png','S04 E03 . Oh Mother,Where Art Thou?','Ma Vreedle threatens to blow up the sun if she does not locate her son. Ben and the Plumbers seek him out.','19 Oct 2013'),
(4, 4, './imgs/Omniverse/s04/s4e4.png','S04 E04 . Return to Forever','Alien thieves try to rob a tourist bus; the Forever Knights threaten to erase all alien DNA on Earth.','26 Oct 2013'),
(4, 4, './imgs/Omniverse/s04/s4e5.png','S04 E05 . Mud Is Thicker Than Water','Ben and his partner Rook head out on a mission to a secret alien city where Ben finds out that his past enemies are looking for him.','2 Nov 2013'),
(4, 4, './imgs/Omniverse/s04/s4e6.png','S04 E06 . OTTO Movies','Kevin and Arjit run into an old friend from The Null Void just in time to see him attempt to rob a galactic car sale, and it falls to Kevin and Rook to stop the crooks from escaping.','9 Nov 2013'),
(4, 4, './imgs/Omniverse/s04/s4e7.png','S04 E07 . The Ultimate Heist','Albedo seeks a device that will change him back into his Galvan form; Ben is locked in Plumber HQ prison.','16 Nov 2013'),
(4, 4, './imgs/Omniverse/s04/s4e8.png','S04 E08 . A Fistful of Brains','Grandpa Max and Rook team up to on a galaxy-wide search for Ben when he is kidnapped by evil hunter Khyber.','23 Nov 2013'),
(4, 4, './imgs/Omniverse/s04/s4e9.png','S04 E09 . For a Few Brains More','Albedos plans to harvest Azmuths intelligence results in Ben trying to stop Albedo and Khyber from getting their hands on Azmuths brain power.','30 Nov 2013'),
(4, 4, './imgs/Omniverse/s04/s4e10.png','S04 E10 . Maxs Monster','Ben, Rook, and Max are put to work when Maxs old partner is in need of assistance as he attempts to tame a monster.','7 Dec 2013');
 -- Continue inserting episodes for season 4 of the Omniverse category

-- Insert sample episodes for Omniverse category, season 5
INSERT INTO episodes (category_id, season, image_path, episode_name, description, release_date) VALUES
(4, 5, './imgs/Omniverse/s05/s5e1.png','S05 E01 . Something Zombozo This Way Comes','Ben battles the Circus Freaks, who are creating zombie clowns throughout the community in Bellwood. Rook joins Ben to find the solution to a creepy problem.','15 Feb 2014'),
(4, 5, './imgs/Omniverse/s05/s5e2.png','S05 E02 . Mystery, Incorporeal','When an enemy returns to cause problems for Ben, who is spending time with Kevin and Gwen at their college campus, Ben attempts to solve the mysterious return.','22 Feb 2014'),
(4, 5, './imgs/Omniverse/s05/s5e3.png','S05 E03 . Bengeance Is Mine','Local plumber Bill Gacks bears a striking resemblance to the universes most evil villain. Psyphon is excited, thinking that Vilgax has returned and bows before him. Ben is suspicious and sets out to prove that Bill really is Vilgax.','1 Mar 2014'),
(4, 5, './imgs/Omniverse/s05/s5e4.png','S05 E04 . An American Benwolf in London','When Kai Greens grandfather is kidnapped by the Forever Knights, Ben and Rook set out to investigate the groups underground activity.','8 Mar 2014'),
(4, 5, './imgs/Omniverse/s05/s5e5.png','S05 E05 . Animo crackers','A future version of Dr Animo provides assistance to his present self so that he has a better chance when fighting Ben.','15 Mar 2014'),
(4, 5, './imgs/Omniverse/s05/s5e6.png','S05 E06 . Rad Monster Party','Ben and Rook receive help from intergalactic smuggler Rad Dudesman to travel through the Anur system.','22 Mar 2014'),
(4, 5, './imgs/Omniverse/s05/s5e7.png','S05 E07 . Charmed, I am Sure','Ben and Rook are forced to team up with Charmcaster after they become stranded on Anur Transyl and need to find a way out.','29 Mar 2014'),
(4, 5, './imgs/Omniverse/s05/s5e8.png','S05 E08 . The Vampire Strikes Back','Ben, Rook, and Rad Dudesman come face to face with the evil Lord Transyl, a vampire-like alien who can make anyone his loyal slave!','5 Apr 2014'),
(4, 5, './imgs/Omniverse/s05/s5e9.png','S05 E09 . Catfight','Empress Attea and Princess Looma arrive on the planet to fight Ben. Things dont go according to the plan as they have to join forces with Rook in order to save him.','12 Apr 2014'),
(4, 5, './imgs/Omniverse/s05/s5e10.png','S05 E10 . Collect This','Simian sells the Earth to Collectimus who comes to claim the planet. Being one of the biggest Ben 10 fans however, he is prepared to strike a deal with his hero.','19 Apr 2014');
 -- Continue inserting episodes for season 5 of the Omniverse category

-- Insert sample episodes for Omniverse category, season 6
INSERT INTO episodes (category_id, season, image_path, episode_name, description, release_date) VALUES
(4, 6, './imgs/Omniverse/s06/s6e1.png','S06 E01 . And Then There Were None','Vilgax and Eon have decided to combine efforts to wipe out every Ben in every dimension. Ben and his friends must hurry to stop them before its too late.','6 Oct 2014'),
(4, 6, './imgs/Omniverse/s06/s6e2.png','S06 E02 . And Then There Was Ben','Professor Paradox unites the good Bens from across all dimensions to take on Vilgax, Eon and the evil Bens in the ultimate showdown.','7 Oct 2014'),
(4, 6, './imgs/Omniverse/s06/s6e3.png','S06 E03 . The Vengers','Captain Nemesis, Billy Billions and Kangaroo Kommando join forces to try and defeat Ben and take his place as protector of Bellwood.','8 Oct 2014'),
(4, 6, './imgs/Omniverse/s06/s6e4.png','S06 E04 . Cough It Up','Psyphon and a group of bounty hunters set their sights on Argit, who is in charge of a dangerous weapon.','9 Oct 2014'),
(4, 6, './imgs/Omniverse/s06/s6e5.png','S06 E05 . The Rooters of All Evil','The Rooters are in search of someone that is close to Ben and will do anything to complete their mission.','10 Oct 2014'),
(4, 6, './imgs/Omniverse/s06/s6e6.png','S06 E06 . Blukic and Driba Go to Area 51','A mysterious Galvan arrives demanding that Blukic and Driba give back a super powerful weapon needed to stop a threat to Earth.','13 Oct 2014'),
(4, 6, './imgs/Omniverse/s06/s6e7.png','S06 E07 . No Honor Among Bros','Rook and Ben must claim back the Golden Fist from an alien fight club, but Rook falls under the influence of Fistricks bro essence and begins to act like a bro.','14 Oct 2014'),
(4, 6, './imgs/Omniverse/s06/s6e8.png','S06 E08 . Universe vs. Tennyson','Ben is taken to intergalactic court by the other Celestialsapiens for re-creating the universe without permission. Ben must plead his case to quadrillions of aliens viewing the trial.','15 Oct 2014'),
(4, 6, './imgs/Omniverse/s06/s6e9.png','S06 E09 . Weapon XI, Part 1','Kevin and Argit contact the amalgam kids in an attempt to warn them about the Rooters while Ben, Rook and Gwen find themselves in the Null Void when searching for Kevin.','16 Oct 2014'),
(4, 6, './imgs/Omniverse/s06/s6e10.png','S06 E10 . Weapon XI, Part 2','The Rooters have convinced Kevin and the amalgam kids to turn against Ben. Its up to Rook and Gwen to help Kevin overcome the opposition.','17 Oct 2014');

-- Repeat the above steps for each category and each season
CREATE TABLE videos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    episode_id INT,
    FOREIGN KEY (episode_id) REFERENCES episodes(id),
    videolink VARCHAR(1000),
      episode_name VARCHAR(100),
    image_path VARCHAR(255),
    description VARCHAR(1000),
    season INT,
    category_id INT,
    INDEX idx_episode_name (episode_name), -- Index on the referenced column
    INDEX idx_description (description), -- Index on the description column
    INDEX idx_image_path (image_path), -- Index on the image_path column
    index idx_season(season),
    index idx_category_id(category_id)
);

INSERT INTO videos (episode_id, videolink, episode_name, image_path, description, season,category_id)
SELECT id,
       CASE 
           WHEN id = 1 AND season = 1 AND category_id=1  THEN 'https://short.ink/nAg-gI7YA?season=1'
           WHEN id = 2 AND season = 1 AND category_id=1 THEN 'https://short.ink/rR6Yi9KuD'
           WHEN id = 3 AND season = 1 AND category_id=1 THEN 'https://short.ink/lLy_pEkGr'
           WHEN id = 4 AND season = 1 AND category_id=1 THEN 'https://short.ink/oNVFJgDhM5'
           WHEN id = 5 AND season = 1 AND category_id=1 THEN 'https://short.ink/8WYWPt20A'
           WHEN id = 6 AND season = 1 AND category_id=1 THEN 'https://short.ink/sW8Bb-Z5l'
           WHEN id = 7 AND season = 1 AND category_id=1 THEN 'https://short.ink/DS1fiEPuz'
           WHEN id = 8 AND season = 1 AND category_id=1 THEN 'https://short.ink/u74b4h3NS'
           WHEN id = 9 AND season = 1 AND category_id=1 THEN 'https://short.ink/icyu5Ga28'
           WHEN id = 10 AND season = 1 AND category_id=1 THEN 'https://short.ink/ucvawN6eg'
           WHEN id = 11 AND season = 1 AND category_id=1 THEN 'https://short.ink/dH0SPTbAx'
           WHEN id = 12 AND season = 1 AND category_id=1 THEN 'https://short.ink/l0wn9hsCG'
           WHEN id = 13 AND season = 1 AND category_id=1 THEN 'https://short.ink/Y_hoObouF'

          WHEN id = 14 AND season = 2 AND category_id=1 THEN 'https://short.ink/rR6Yi9KuD'
          WHEN id = 15 AND season = 2 AND category_id=1 THEN 'https://short.ink/rR6Yi9KuD'
           WHEN id = 16 AND season = 2 AND category_id=1 THEN 'https://short.ink/rR6Yi9KuD'
        WHEN id = 17 AND season = 2 AND category_id=1 THEN 'https://short.ink/rR6Yi9KuD'
        WHEN id = 18 AND season = 2 AND category_id=1 THEN 'https://short.ink/rR6Yi9KuD'
        WHEN id = 19 AND season = 2 AND category_id=1 THEN 'https://short.ink/rR6Yi9KuD'
        WHEN id = 20 AND season = 2 AND category_id=1 THEN 'https://short.ink/rR6Yi9KuD'
        WHEN id = 21 AND season = 2 AND category_id=1 THEN 'https://short.ink/rR6Yi9KuD'
        WHEN id = 22 AND season = 2 AND category_id=1 THEN 'https://short.ink/rR6Yi9KuD'
        WHEN id = 23 AND season = 2 AND category_id=1 THEN 'https://short.ink/rR6Yi9KuD'
        WHEN id = 24 AND season = 2 AND category_id=1 THEN 'https://short.ink/rR6Yi9KuD'
        WHEN id = 25 AND season = 2 AND category_id=1 THEN 'https://short.ink/rR6Yi9KuD'
        WHEN id = 26 AND season = 2 AND category_id=1 THEN 'https://short.ink/rR6Yi9KuD'

          WHEN id = 27 AND season = 3 AND category_id=1 THEN 'https://short.ink/rR6Yi9KuD'
        WHEN id = 28 AND season = 3 AND category_id=1 THEN 'https://short.ink/rR6Yi9KuD'
        WHEN id = 29 AND season = 3 AND category_id=1 THEN 'https://short.ink/rR6Yi9KuD'
        WHEN id = 30 AND season = 3 AND category_id=1 THEN 'https://short.ink/rR6Yi9KuD'
        WHEN id = 31 AND season = 3 AND category_id=1 THEN 'https://short.ink/rR6Yi9KuD'
        WHEN id = 32 AND season = 3 AND category_id=1 THEN 'https://short.ink/rR6Yi9KuD'
        WHEN id = 33 AND season = 3 AND category_id=1 THEN 'https://short.ink/rR6Yi9KuD'
        WHEN id = 34 AND season = 3 AND category_id=1 THEN 'https://short.ink/rR6Yi9KuD'
        WHEN id = 35 AND season = 3 AND category_id=1 THEN 'https://short.ink/rR6Yi9KuD'
        WHEN id = 36 AND season = 3 AND category_id=1 THEN 'https://short.ink/rR6Yi9KuD'
        WHEN id = 37 AND season = 3 AND category_id=1 THEN 'https://short.ink/rR6Yi9KuD'
        WHEN id = 38 AND season = 3 AND category_id=1 THEN 'https://short.ink/rR6Yi9KuD'
        WHEN id = 39 AND season = 3 AND category_id=1 THEN 'https://short.ink/rR6Yi9KuD'

        WHEN id = 40 AND season = 4 AND category_id=1 THEN 'https://short.ink/rR6Yi9KuD'
        WHEN id = 41 AND season = 4 AND category_id=1 THEN 'https://short.ink/rR6Yi9KuD'
        WHEN id = 42 AND season = 4 AND category_id=1 THEN 'https://short.ink/rR6Yi9KuD'
        WHEN id = 43 AND season = 4 AND category_id=1 THEN 'https://short.ink/rR6Yi9KuD'
        WHEN id = 44 AND season = 4 AND category_id=1 THEN 'https://short.ink/rR6Yi9KuD'
        WHEN id = 45 AND season = 4 AND category_id=1 THEN 'https://short.ink/rR6Yi9KuD'
        WHEN id = 46 AND season = 4 AND category_id=1 THEN 'https://short.ink/rR6Yi9KuD'
        WHEN id = 47 AND season = 4 AND category_id=1 THEN 'https://short.ink/rR6Yi9KuD'
        WHEN id = 48 AND season = 4 AND category_id=1 THEN 'https://short.ink/rR6Yi9KuD'
        WHEN id = 49 AND season = 4 AND category_id=1 THEN 'https://short.ink/rR6Yi9KuD'
        WHEN id = 50 AND season = 4 AND category_id=1 THEN 'https://short.ink/rR6Yi9KuD'
        WHEN id = 51 AND season = 4 AND category_id=1 THEN 'https://short.ink/rR6Yi9KuD'
        WHEN id = 52 AND season = 4 AND category_id=1 THEN 'https://short.ink/rR6Yi9KuD'
        WHEN id BETWEEN 53 AND 210  AND season BETWEEN 1 and 6 AND category_id BETWEEN 2 and 4 THEN 'https://short.ink/rR6Yi9KuD'
           ELSE 'default_video_link'
       END AS videolink,
       episode_name,
       image_path,
       description,
       season,
       category_id
FROM episodes;

