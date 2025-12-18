# Headings

Add number signs (#) in front of a word or phrase.

- # # Adds a heading level 1
- ## ## Adds a heading level 2
- ### ### Adds a heading level 3
- #### #### Adds a heading level 4
- ##### ##### Adds a heading level 5
- ###### ###### Adds a heading level 6

> #### Note
> - For compatibility, always put a space between the number signs and the heading name.
> - You should also put blank lines before and after a heading for compatibility.

# Emphasis

## Bold

To bold text, add two asterisks or underscores before and after a word or phrase. To bold the middle
of a word for emphasis, add two asterisks without spaces around the letters.

- I just love \**bold text**.
- I just love \__bold text__.
- Love\**is**bold

## Italic

To italicize text, add one asterisk or underscore before and after a word or phrase. To italicize the
middle of a word for emphasis, add one asterisk without spaces around the letters.

- Italicized text is the *cat's meow*.
- Italicized text is the _cat's meow_.
- A*cat*meow

## Bold and Italic

To emphasize text with bold and italics at the same time, add three asterisks or underscores before and
after a word or phrase. To bold and italicize the middle of a word for emphasis, add three asterisks
without spaces around the letters.

- This text is ***really important***.
- This text is ___really important___.

# Blockquotes

To create a blockquote, add a **>** in front of a paragraph.
Blockquotes can be nested. Add a **>>** in front of the paragraph you want to nest.

> ###Note
> Blockquotes can contain other Markdown formatted elements. Not all elements can be used — you’ll need to experiment to see which ones work.

# Lists

### Ordered Lists

To create an ordered list, add line items with numbers followed by periods. The numbers don’t have
to be in numerical order, but the list should start with the number one.

\1. First item
\2. Second item
\3. Third item 

\1. First item
\1. Second item
\1. Third item

### Unordered Lists

To create an unordered list, add dashes (-), asterisks (*), or plus signs (+) in front of
line items. Indent one or more items to create a nested list.

\- First item
\- Second item
\- Third item

\* First item
\* Second item
\* Third item

\+ First item
\+ Second item
\+ Third item

# Code Blocks

- Code blocks are normally indented four spaces or one tab. When they’re in a list, indent them eight spaces or two tabs.
- To denote a word or phrase as code, enclose it in backticks (**`**).



# Images

\![Tux, the Linux mascot](/assets/images/tux.png)
![Tux, the Linux mascot](/assets/images/tux.png)

# Links

To create a link, enclose the link text in brackets and then follow it immediately with the URL in parentheses.

My favorite search engine is \[Duck Duck Go](https://duckduckgo.com).
My favorite search engine is [Duck Duck Go](https://duckduckgo.com).

You can optionally add a title for a link. This will appear as a tooltip when the user hovers 
over the link. To add a title, enclose it in quotation marks after the URL.

My favorite search engine is \[Duck Duck Go](https://duckduckgo.com "The best search engine for privacy"
My favorite search engine is [Duck Duck Go](https://duckduckgo.com "The best search engine for privacy"

# Horizontal Rules

To create a horizontal rule, use three or more asterisks (***), dashes (---), or underscores (___) on a line by themselves.



# Tables

To add a table in Markdown, use the vertical line **|** to separate each column, and use three
or more dashes **---** to create each column’s header. A vertical line should also be 
added at either end of the row.

> | Month    | Savings |
> | -------- | ------- |
> | January  | $250    |
> | February | $80     |
> | March    | $420    |

or

> | Item              | In Stock | Price |
> | :---------------- | :------: | ----: |
> | Python Hat        |   True   | 23.99 |
> | SQL Hat           |   True   | 23.99 |
> | Codecademy Tee    |  False   | 19.99 |
> | Codecademy Hoodie |  False   | 42.99 |


- **:--** means the column is left aligned.
- **--:** means the column is right aligned.
- **:-:** means the column is center aligned.





