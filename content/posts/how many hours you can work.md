---
title: How many hours a day can you write code
date: 2025-02-19
created: 2025-02-19T08:49
updated: 2025-02-19T08:49
---


How many hours a day can you write code, and at what point does the quality of your work go down? Even more important is how many weeks and months of that max effort you can still be effective.

In my life, there have only been three periods where I worked crazy hours, and only two of those were multiple months. Generally, over my forty years, I worked a reasonably regular schedule. The standard forty hours a week rarely involve only writing code; you are always doing other things, such as meetings, talking with people, reading or writing documentation, emails, or, more recently, Slack messages and the like, or even reviewing code (which is like coding).

This post documents my first experience working long hours of coding. It lasted only a week and culminated in working about 30 hours in a row (followed by sleeping for two days). I was 26.

In 1985, I conceived the idea that became Trapeze, the first real alternative to row-and-column addressing in spreadsheets, which was first created with Visicalc. Trapeze used formulas referencing blocks of data by name, an odd hybrid of APL, spreadsheets, and ideas you see today in frameworks like Pandas. I got investments from various people, assembled a team, and started building the product. We were still working on it a year later, hoping to ship it at the December 1987 MacWorld in San Francisco. In August of 1986, we all went to the Boston MacWorld.

Of course, there was no internet, so experiencing other people's applications was only possible if you bought a copy. There were also few magazines, so it wasn't easy to see how different applications' UIs looked. In those days, I designed and built the UI for Trapeze while my two partners built the internals. Looking at all the demos was the first time I saw what UI should look like.

What I saw horrified me; my UI design was terrible and unusable.

So, I intended to design and build an entirely new UI while supporting the old one. This would allow the other two to finish the internals until I could integrate the replacement.

What followed was working around 90 hours a week for four and a half months. Every weekday, I worked from 8 to 6, went home for two hours, and returned from 8 until 2 A.M or until the second Jolt Cola failed to keep me awake. Then, I slept for a few hours before starting over. I worked from 8 until 6 on Saturday and Sunday afternoons for a few hours. I had to work in the office, as no one had a Mac at home, yet our office lacked AC on weekends.

We barely finished the product before the SF MacWorld show, where we introduced Trapeze. I did many of the demos. I discovered a horrible statistical bug: every time I tapped the central pop-up, hierarchical menu in my UI, it had a 10% possibility of crashing. That's not a great look for a new product, and that menu was the first Mac product to feature either, even before Apple released support in MacOS. When we returned to the office, we had to (manually) put together all the packaging.

In addition to all the coding, I had to deal with the manual, give press interviews, and all the other founder things.

After this, I was so run down that people forced me to go to the doctor, and he put me in the hospital for several days.

Besides introducing that crash (which was fixed before shipping, thankfully), I also failed to consider how to sell Trapeze appropriately; Trapeze was a powerful application and should have been sold directly to people most likely able to understand that. Instead, I went with the easy standard mail order and retail store sales via distributors, but that put us in the same category as Microsoft Excel, confusing people who thought we were just a regular spreadsheet application. Predictably, we failed miserably. Instead, like Mathematica did two years later, we should have sold via a sales team. The customers who saw Trapeze as a powerful modeling tool (it could do things Excel still can't do today) found it indispensable. My addled brain had no cycles for considering how imperfect selling retail was.

While I didn't die, the experience was no fun at all. Thankfully, it would be thirty years before I had to work crazy hours again. Ninety hours a week is nuts to work, much less for months. Programming is one of the most brain-intensive activities you can do, and pushing it for so long affects your physical, mental, emotional, and social well-being.

Fast-forward three decades, and I am working for what would be my final employer in a giant non-tech company, working in a large division on a strategically important part of our iOS apps. I was hired because one business unit was undergoing a significant business change ($40M budget), and the iOS and Android apps would be the customer connection. They had spent 18 months planning what to build, and my partner and I spent 9 months on the code. At that point, it looked to be moving into a 3-month testing phase, and he was transferred to another project in another country. I was the only iOS programmer left on the project.

There was a customer service type of internal app I had built earlier, and now a bunch of execs wanted a considerable expansion of it (one of those "we want it to do anything and everything" requests), so I was assigned to do that as well, considering testing would not require my full attention.

Then came the "mother of all change requests," as I like to call it.

Someone requested a massive expansion of the mostly completed product that would also affect the entire business unit's operations. Suddenly, many new teams had to be added, and everyone would have to make massive changes, but there was no more budget, so I would have to do all the iOS work by myself. In addition, a new team was required to build a crucial piece with which I would interact. They only had two contractors and a lead who did nothing. They had no idea what to do or start, so I told them I would help and became their virtual lead, reviewing the code and guiding the development. I even had to do QA, as that team had no QA.

Of course, I also had to work on my changes, support that team every day, and work on that customer service app simultaneously. This turned into three months of working seven days a week, around 70 hours each week.

The customer service project should have been postponed, but company politics did not allow that, so I was stuck doing three jobs simultaneously. By the end of the three months, I remember sitting in my manager's office, wondering aloud if I could do it for much longer. I was 59 years old!

The lessons I learned from the earlier story did make a difference. I ensured I slept well, ate decent food, and slowed down a lot, being more deliberate in everything. When you are tired, the easiest thing to do is work faster to get it done quicker, but that's how you make mistakes and miss things. It seems counter-intuitive, but that is the only way to ensure you do the right thing and avoid fixing things later. Juggling three tasks was hard; context-switching when tired is no fun.

After three months, I finished my code, the contractors delivered their part, and the customer service app was done and beginning deployment (eventually, various business units used it worldwide). We shipped the big project, and it was a hit with customers and executives. Eventually, it would bring in low nine figures of revenue per year (I calculated this one thing brought in more money than everything I ever worked on put together times ten).

These are two examples from my life; hopefully, they resonate somewhat. I've known many people who worked long hours, and it's never good.

Programming is not the only job that does long hours.

In my first job in the early 80s, a manager worked crazy hours and was a high-energy person. One day, he fell face down on the table during a meeting, instantly dead. I once ate in a restaurant where someone was hauled out on a stretcher; I asked a waiter, and he said the manager had been working double shifts seven days a week (i.e., about 110 hours a week). Young Wall Street bankers often work 90 hours a week and also frequently use ADHD drugs and/or cocaine to fuel the work. All I used was Jolt Cola.

Working these sorts of hours is a terrible way to treat your body and mind. Sometimes, you have to, but doing it for long periods can be a killer. It's not worth it, no matter how much you make. I did it for my own company in the first story, but I could have killed myself. In the second, I had little choice since there was no one else and no budget to hire anyone, even if that would have helped. I know people, such as in the triple-A games industry, who work insane hours month after month. In their case, this is often followed up by being laid off. It's not worth it. You will suffer health issues, mental issues, social stigma, and likely burnout. Even if you are paid massive amounts of money, if you die, you can't benefit from it, and your employer will replace your corpse.

We can all manage it in short bursts, but month after month is too much. If you find yourself stuck in this, consider leaving. I would respect someone who realizes they are destroying themselves and gives up more than someone who toughs it out until they collapse.

Programming can be hard enough in regular circumstances, especially today; trying to do it in a brain fog with little sleep and bad food is unlikely to be very good. I was fortunate the second episode came out well. The first did not, as we had to give up and sell our product, and I started another company to build Mac apps for other people (work on Persuasion for a year and Deltagraph for 5 years). If I had had a clearer head, Trapeze might still be around, but my head was full of mush.

Don't be that person if you can help it.
