# Headings

Add number signs (*#*) in front of a word or phrase.

- # # Adds a heading level 1
- ## ## Adds a heading level 2
- ### ### Adds a heading level 3
- #### #### Adds a heading level 4
- ##### ##### Adds a heading level 5
- ###### ###### Adds a heading level 6

> #### Notes
> - For compatibility, always put a space between the number signs and the heading name.  
> - You should also put blank lines before and after a heading for compatibility.

# Emphasis

## Bold

To bold text, add two asterisks or underscores before and after a word or phrase. To bold the middle  
of a word for emphasis, add two asterisks without spaces around the letters.
<!-- I just love **bold text**. -->
- I just love **\*\*bold text\*\***.
- I just love __\_\_bold text\_\___.
- Love **\*\*is\*\*** bold

## Italic

To italicize text, add one asterisk or underscore before and after a word or phrase. To italicize the  
middle of a word for emphasis, add one asterisk without spaces around the letters.
<!-- Italicized text is the *cat's meow*. -->
- Italicized text is the *\*cat's meow\**.
- Italicized text is the _\_cat's meow\__.
- A *\*cat\** meow

## Bold and Italic

To emphasize text with bold and italics at the same time, add three asterisks or underscores before  
and after a word or phrase. To bold and italicize the middle of a word for emphasis, add three  
asterisks without spaces around the letters.
<!-- This text is ***really important***. -->
- This text is ***\*\*\*really important\*\*\****.
- This text is ___\_\_\_really important\_\_\____.

# Blockquotes

To create a blockquote, add a > in front of a paragraph. Blockquotes can be nested. Add a >> in front  
of the paragraph you want to nest. Example:  

\> ### Note  
\> Blockquotes can contain other Markdown formatted elements. Not all elements can be used — you’ll need  
\> to experiment to see which ones work.

> ### Note
> Blockquotes can contain other Markdown formatted elements. Not all elements can be used — you’ll need  
> to experiment to see which ones work.

# Line Breaks

To create a line break or new line (\<br>), **end a line with two or more spaces, and then type return**.

# Lists

### Ordered Lists

To create an ordered list, add line items with numbers followed by periods. The numbers don’t have to be  
in numerical order, but the list should start with the number one.

1. First item
2. Second item
3. Third item

### Unordered Lists

To create an unordered list, add dashes (-), asterisks (*), or plus signs (+) in front of line items.  
Indent one or more items to create a nested list.

- First item
- Second item
- Third item

# Code Blocks

Code blocks are normally indented four spaces or one tab. When they’re in a list, indent them eight spaces or two tabs.  
To denote a word or phrase as code, enclose it in backticks ( ` ).  
You can also use three consecutive backticks to create a multiline code bock and right after the   
first three backticks, you must indicate the code language name with [language-name].

\`dnf install -y git\`  
`dnf install -y git`

  
\```[python]  
def hello_world():  
&emsp;print("Hello, world!")  
\```
```[python]
def hello_world():
   print("Hello, world!")
```



# Images

\!\[Black shy guy](https://mario.wiki.gallery/images/c/cd/MKT_Artwork_BlackShyGuy.png)  

![Black shy guy](https://mario.wiki.gallery/images/c/cd/MKT_Artwork_BlackShyGuy.png)


# Links

To create a link, enclose the link text in brackets and then follow it immediately with the URL in parentheses.

My favorite search engine is \[Duck Duck Go](https://duckduckgo.com){:target="_blank"}.  
My favorite search engine is [Duck Duck Go](https://duckduckgo.com{:target="_blank"}).

# Horizontal Rules

To create a horizontal rule, use three or more asterisks (***), dashes (---), or underscores (___) on a line by themselves.

\***
***

\---
---

\___
___

# Tables

To add a table in Markdown, use the vertical line | to separate each column, and use three  
or more dashes --- to create each column’s header. A vertical line should also be  
added at either end of the row.

\| Month    | Savings |  
\| -------- | ------- |  
\| January  | $250    |  
\| February | $80     |  
\| March    | $420    |

| Month    | Savings |
| -------- | ------- |
| January  | $250    |
| February | $80     |
| March    | $420    |

or

\| Item              | In Stock | Price |  
\| :---------------- | :------: | ----: |  
\| Python Hat        |   True   | 23.99 |  
\| SQL Hat           |   True   | 23.99 |  
\| Codecademy Tee    |  False   | 19.99 |  
\| Codecademy Hoodie |  False   | 42.99 |  


| Item              | In Stock | Price |
| :---------------- | :------: | ----: |
| Python Hat        |   True   | 23.99 |
| SQL Hat           |   True   | 23.99 |
| Codecademy Tee    |  False   | 19.99 |
| Codecademy Hoodie |  False   | 42.99 |


- **( :-- )** means the column is left aligned.
- **( --: )** means the column is right aligned.
- **( :-: )** means the column is center aligned.





