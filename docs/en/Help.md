

- [FAQ(pukiwiki.org)](/en/pukiwiki:PukiWiki/FAQ)(Japanese)

- [Text Formatting Rule Abstract](/en/FormatRule) (also included as the last part of this page)

    - [Text Formatting Rule](/en/TextFormattingRule) (now preparing. Please refer to pukiwiki.dev site: [Text Formatting Rule](/dev/cmd=read&page=_CategoryDev/Document/Text Formatting Rule).)

- [Plugin Help](/en/PluginHelp)

#### What's PukiWiki? [#vf6f358a]
Anyone can edit all of the pages((except for pages frozen by the administrators)) in the PukiWiki. You move to the page you want to edit, and click "[ Edit ]" at the top of the page. Then you can see a textfield, in which you can edit the descriptions of page.
The edited content are formed by the [FormatRule](/en/FormatRule).

You can edit the page [ForPractice](/en/ForPractice) in any way as a rule. So we advise you to try and edit a page!

#### How to make a new page [#neb8078e]
If you write **'WikiName**' that includes two capitalized letters and **'BracketName**' enclosing [[]], the mark **?** appears at the tail of the written text strings. If you click the mark, the new page and the editable textfield are created, and you can modify the page the same way you usually edit a page.

#### What's the string attached to Links, such as "(3m)"? [#ab8c62f1]
The string (3m) shows that the page was updated about 3 minites ago , (5h) means about 5 hours, and (8d) means  about 8 days.

#### Is this different from a BBS? [#q5170569]
Yes, a little. If you modify a page, the page cannot show who was the modifier. So you can write your name near your changes. -- [Developer Team](/en/Developer Team) ... like this.

#### Can someone remove all the descriptions in a page? [#k3570b93]
Yes! In WikiClone, such as PukiWiki, anyone can dirty, remove, and even ruin pages. PukiWiki, however, can do periodical backups, so the bad attacks will be ineffective. It is possible to recover the attacked pages easily.  

#### Could the browser cache and proxy cancel my modifications? [#z07c55bf]
If another person is editing the page you are editing, what happens? It's OK. PukiWiki checks the differences between the changes on the original page and your modifications, by comparing the date of the  updated original page with the date of your updated page. 

In the case of conflict, you should reload the page you have edited and try to edit it again.

#include(FormatRule)
