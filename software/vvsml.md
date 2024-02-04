<html>
  <head>
    <link rel="stylesheet" href="../style.css"/>
    <link rel="icon" href="../res/favicon.ico"/>
    <title>tirimid.net - VVSML</title>
  </head>
  <body>
    <h1>VVSML</h1>
    <h2>What is VVSML... And why?</h2>
    <p>
      So, you know Markdown and HTML, right? It's kind of like that. VVSML is a
      markup language designed to build into a HTML file. If you want
      simplicity, use Markdown. I didn't want simplicity: I wanted a
      programming-language-like syntax based loosely on LaTeX, but without all
      the fuss involved in using LaTeX. Thus, (V)ery (V)ery (S)imple (M)arkup
      (L)anguage was born. The question comes about, then: "why not just use
      HTML? It has a proglang-like syntax without the fuss of LaTeX". Honestly,
      I just really dislike how HTML feels to write. Plus, HTML has no dedicated
      features for conlanging - which I wanted.
    </p>
    <h2>Using VVSML</h2>
    <p>
      First; download, build, and install the VVSML program from
      <a href="https://github.com/tirimid/vvsml" target="_blank">the GitHub</a>.
      You can do so using:
    </p>
    <code class="codelong">
$ git clone https://github.com/tirimid/vvsml
$ cd vvsml
$ cargo build --release
$ sudo cp target/release/vvsml /usr/bin
    </code>
    <p>
      The actual <code>vvsml</code> binary takes two arguments. Run
      <code>vvsml</code> to see the following:
    </p>
    <code class="codelong">
$ vvsml
error usage: `vvsml &lt;source file&gt; &lt;output file&gt;`
    </code>
    <p>
      The <code>source file</code> is meant to be the name of a VVSML source
      file, and <code>output file</code> is meant to be the name of the file in
      which to output HTML code generated using the VVSML source. If the given
      <code>output file</code> does not exist, it should be created by the
      program. So, what are we waiting for? Let's get the show on the road.
      Create a new file for VVSML source - I suggest using the
      <code>.vvsml</code> extension for it. Then, open it in your text editor.
      Run:
    </p>
    <code class="codelong">
$ touch hello.vvsml
$ emacs -nw hello.vvsml
    </code>
    <p>
      Below is some demo source code in VVSML:
    </p>
    <code class="codelong">
contents
{
    chapter {This is a very large heading}
    section {This is a large heading}
    subsection {This is a relatively small heading}
    text {This is a paragraph}
}
    </code>
    <p>
      The LaTeX influence is obvious. Note that this can be laid out in many
      ways, <code>vvsml</code> doesn't care if you place braces on the same
      line, a new line, if they are touching the keyword, etc. Also, the
      whitespace in the above example is arbitrary. VVSML is very relaxed with
      regard to formatting, but it cares intensely about structure. To explain
      how <code>vvsml</code> handles code structure, we have to understand two
      main types of substructure: "layers" and "textual extractors". A layer is
      a code element which contains sub-elements as a list - in this example,
      the <code>contents</code> contains a <code>chapter</code>, a
      <code>section</code>, a <code>subsection</code>, and a <code>text</code>;
      in that order. Each of those are textual extractors: they do not and
      cannot contain other code elements. Instead, they contain literal text as
      data. Flipwise, layers cannot contain textual data but they can contain
      code elements (textual extractors and other layers). In fact, try adding
      some random words into the <code>contents</code>, as follows:
    </p>
    <code class="codelong">
contents
{
    chapter {...}
    section {...}
    subsection {...}
    text {...}
    here is some random text outside of a textual extractor!
}
    </code>
    <p>Then, try to build as follows:</p>
    <code class="codelong">
$ vvsml hello.vvsml out.html
error test.vvsml:7 - expected one of [chapter, section, subsection, text, list,
ordered list, table, block end], found other
    </code>
    <p>
      See? It gives us a list of code elements which we can place inside the
      <code>contents</code>. We cannot have textual data inside a layer.
      Awesome! We have a nicely formatted markup file describing the contents of
      a document; what now? Well, you now know pretty much everything necessary
      to write things using VVSML. Now I will go over the more advanced layers,
      those you saw in the prior error message. See the below code:
    </p>
    <code class="codelong">
contents
{
    list
    {
        subsection {first item in list}
        text {second item in list}
        chapter {third item in list}
        section {...}
    }
    ordered_list
    {
        subsection {first item in list}
        text {second item in list}
        chapter {third item in list}
        section {...}
    }
}
    </code>
    <p>
      This is a demonstration of the <code>list</code> and
      <code>ordered_list</code> layers. They work in effectively the same way:
      their child layers are displayed as lists when the output HTML is viewed
      in a web browser. Both are actually ordered: the items are displayed in
      the same order that they are written in the VVSML source. The only
      difference between the two types of list is that <code>list</code> outputs
      a list which uses dot or bullet points, while <code>ordered_list</code>
      outputs a list whose entries are numbered starting from 1. That's it for
      the list layers. Now, see the following <code>table</code> code:
    </p>
    <code class="codelong">
contents
{
    table
    {
        row
        {
            text {-}
            text {a}
            text {b}
            text {c}
        }
        row
        {
            text {1}
            text {a1}
            text {b1}
            text {c1}
        }
        row
        {
            text {2}
            text {a2}
            text {b2}
            text {c2}
        }
        row
        {
            text {3}
            text {a3}
            text {b3}
            text {c3}
        }
    }
}
    </code>
    <p>
      A <code>table</code> can only contain one code element: the
      <code>row</code>. These <code>row</code>s, however, can contain any layer
      or textual extractor. Since it's hard to put into words, check out the
      cool table produced by the above code:
    </p>
    <table>
      <tr>
        <td><p>-</p></td>
        <td><p>a</p></td>
        <td><p>b</p></td>
        <td><p>c</p></td>
      </tr>
      <tr>
        <td><p>1</p></td>
        <td><p>a1</p></td>
        <td><p>b1</p></td>
        <td><p>c1</p></td>
      </tr>
      <tr>
        <td><p>2</p></td>
        <td><p>a2</p></td>
        <td><p>b2</p></td>
        <td><p>c2</p></td>
      </tr>
      <tr>
        <td><p>3</p></td>
        <td><p>a3</p></td>
        <td><p>b3</p></td>
        <td><p>c3</p></td>
      </tr>
    </table>
    <p>
      I hope that clears up any confusion. Anyway, it may be important to note
      that each of these layers can be nested inside of each other. That is to
      say, you can place a <code>list</code> inside of another
      <code>list</code>, or a <code>table</code> inside an
      <code>ordered_list</code>, a <code>table</code> inside a <code>row</code>,
      and so on. A <code>row</code>, however, cannot appear outside of a
      <code>table</code>. You now know all the core features of VVSML,
      congratuations!
    </p>
    <h2>Some of the crazier features</h2>
    <p>
      Apart from the core features, <code>vvsml</code> also implements some
      convenient stuff that I just thought would be kind of nice. First,
      character escapes. If you wanted a "}" in a <code>text</code>, you
      wouldn't normally be able to add it - but with escape characters, you can.
      To escape a character, add <code>]]$</code> in front of it. The only
      characters that can be escaped are "{", "}", "@", ".", and "]". Trying to
      escape anything else will cause <code>vvsml</code> to output an error.
    </p>
    <p>
      That's nice, but it's not crazy. What is crazy is the preprocessor. In
      VVSML, there are several "preprocessor directives" which can be placed in
      your code to cause <code>vvsml</code> to do certain things before actually
      processing anything. The first preprocessor directives to know are
      <code>.define_macro</code> and <code>macro</code>.
    </p>
    <code class="codelong">
.define_macro {name of macro} {value after expansion}
contents
{
    text {.macro {name of macro}}
}
    </code>
    <p>
      This does exactly what you would expect. Note that all
      <code>.define_macro</code>s are processed before any <code>.macro</code>s,
      so you can define them anywhere you want in the file - they don't have to
      appear before their first usage in the file. After macro expansion, the
      above code looks like this:
      </p>
    <code class="codelong">

contents
{
    text {value after expansion}
}
    </code>
    <p>
      Unlike the prior code elements, <code>.define_macro</code> takes two
      arguments instead of just one. The first describes the name of a symbol in
      a symbol table, and the second describes the value of that symbol. Note
      that the name of the symbol (and the value) can be any valid UTF-8 string.
      Then, <code>.macro</code> does a lookup in the symbol table using its
      argument, and replaces itself with the value if the lookup is successful.
    </p>
    <p>
      The next preprocessor directive is <code>.link</code>. <code>.link</code>
      takes a piece of text and makes it into a clickable URL when its output is
      viewed in a browser. Like <code>.define_macro</code>, it takes two
      arguments: the text of the link, and the destination. See:
    </p>
    <code class="codelong">
contents
{
    text {the below link will send you to google.com:}
    text {.link {a link to google.com} {https://google.com/}}
}
    </code>
    <p>
      Then: <code>.unicode</code>. This one takes a single argument, a unicode
      codepoint in hexadecimal. See:
    </p>
    <code class="codelong">
contents
{
    subsection {the two texts below will output the same HTML}
    text {/.unicode {0068}.unicode {0065}.unicode {026a}/}
    text {/&#104;&#101;&#618;/}
}
    </code>
    <p>
      So that's pretty simple so far - nothing too wacky. The next few features
      are either more complex or crazier. So then, regular expressions. If you
      want the preprocessor to scan through your entire file and perform
      regex-replacements on its text, VVSML gives you <code>.replace_all</code>.
      All written regex replacements are done in the order they appear in the
      file - top down, left to right. <code>.replace_all</code> takes two
      arguments: the regular expression to match against, and the replacements.
      Note that the first argument can't really contain curly braces since that
      would mess up <code>vvsml</code>'s function. Check the below example:
    </p>
    <code class="codelong">
.replace_all {this is very [gb][oa][od]d?} {regular expressions...}
contents
{
    text {this is very good}
    text {this is very bad}
}
    </code>
    <p>After preprocessing, this becomes:</p>
    <code class="codelong">

contents
{
    text {regular expressions...}
    text {regular expressions...}
}
    </code>
    <p>
      The next feature, <code>.format</code>, is much more involved. In the
      previous parts of this... tutorial? you have seen many ways to format a
      written document - different sized headers, URLs, lists, tables, etc.
      However, there is more to formatting than just general layouts. For
      example, there is text weight and minor positioning like sub /
      superscripting. This is where <code>.format</code> comes in.
      <code>.format</code> takes two arguments: a string containing some textual
      data, and a string describing how that text should be formatted. This
      "description" of the formatting is done by writing certain format
      specifiers in the descriptor string. See the table below defining each
      of the available format specifiers:
    </p>
    <table>
      <tr>
        <td><p>b</p></td>
        <td><p>The text should be made bold</p></td>
      </tr>
      <tr>
        <td><p>i</p></td>
        <td><p>The text should be made italic</p></td>
      </tr>
      <tr>
        <td><p>_</p></td>
        <td><p>The text should be subscripted</p></td>
      </tr>
      <tr>
        <td><p>^</p></td>
        <td><p>The text should be superscripted</p></td>
      </tr>
      <tr>
        <td><p>s</p></td>
        <td><p>The text should have a strikethrough</p></td>
      </tr>
      <tr>
        <td><p>x</p></td>
        <td>
          <p>
            The text should be treated as X-SAMPA text and be converted to IPA
            unicode characters
          </p>
        </td>
      </tr>
      <tr>
        <td><p>p</p></td>
        <td>
          <p>
            The text should be treated as Praat text and be converted to IPA
            unicode characters
          </p>
        </td>
      </tr>
      <tr>
        <td><p>B</p></td>
        <td>
          <p>
            The text should be treated as Branner text and be converted to IPA
            unicode characters
          </p>
        </td>
      </tr>
    </table>
    <p>These can be combined in any way to overlap their effects. See:</p>
    <code class="codelong">
contents
{
    text {.format {b} {bold}}
    text {.format {i} {italic}}
    text {.format {si_} {strikethrough, italic, and subscripted}}
    text {.format {b^} {bold and superscripted}}
    text {.format {x} {Eks sAmp@}}
}
    </code>
    <p>
      I think this is a very nice demonstration of the <code>.format</code>
      preprocessor directive. The last feature I want to talk about in this
      section is <code>.external_table</code>. After seeing the above syntax for
      the <code>table</code> layer, you probably thought: "wow, this is
      inconvenient and I wish there was a nicer syntax for it". Well,
      <code>vvsml</code> defines a separate syntax for tables which is easier
      and much less unwieldy. In order to use it, create a new file to store
      this table - I recommend the <code>.vvtab</code> file extension. Then,
      open this file in your text editor:
    </p>
    <code class="codelong">
$ touch example.vvtab
$ emacs -nw example.vvtab
    </code>
    <p>After opening this file, try writing the following code:</p>
    <code class="codelong">
- & a  & b  & c  $
1 & a1 & b1 & c1 $
2 & a2 & b2 & c2 $
3 & a3 & b3 & c3 $
    </code>
    <p>Then, go back to <code>hello.vvsml</code> and write the following:</p>
    <code class="codelong">
contents
{
    .external_table {example.vvtab}
}
    </code>
    <p>
      <code>.external_table</code> takes one argument - the path of the file
      containing your table. I call this special table syntax "VVtab", a mixing
      of "VVSML" and "table". In VVtab, all table elements are assumed to be
      <code>text</code>s. Each item in a row is seperated by a <code>&</code>,
      and each row is seperated by a <code>$</code>. Again, the LaTeX influence
      here is clearly visible. The fact that "&" and "$" are pretty common
      characters necessitates that VVtab introduce an escape character for being
      able to write them without being interpreted as seperators. Simple: just
      place a "\" before them. Done and dusted. Note that the above table is
      equivalent to the one described in the previous section.
    </p>
  </body>
</html>
