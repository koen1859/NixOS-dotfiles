{pkgs, ...}: {
  programs.nixvim.plugins = {
    vimtex = {
      enable = true;
      texlivePackage = pkgs.texliveSmall.withPackages (ps:
        with ps; [
          latexmk
          amsmath
	  marvosym
          bbm-macros
	  minted
	  texcount
	  tocbibind
	  latexindent
        ]);
    };
  };
  home.file.".texmf/bibtex/bst/rug-econometrics/rug-econometrics.bst".text = ''
    %%% ====================================================================
    %%%  @BibTeX-style-file{
    %%%     filename        = "chicago.bst",
    %%%     version         = "4",
    %%%     date            = "28 August 1992",
    %%%     time            = "10:23:39 199",
    %%%     author          = "Glenn Paulley",
    %%%     address         = "Data Structuring Group
    %%%                        Department of Computer Science
    %%%                        University of Waterloo
    %%%                        Waterloo, Ontario, Canada
    %%%                        N2L 3G1",
    %%%     telephone       = "(519) 885-1211",
    %%%     FAX             = "(519) 885-1208",
    %%%     email           = "gnpaulle@bluebox.uwaterloo.ca",
    %%%     codetable       = "ISO/ASCII",
    %%%     keywords        = "BibTeX style, Chicago Manual of Style",
    %%%     supported       = "yes",
    %%%     abstract        = "A BibTeX bibliography style that follows the
    %%%                        `B' reference style of the 13th Edition of
    %%%                        the Chicago Manual of Style. A detailed
    %%%                        feature list is given below.",
    %%%     checksum        = "60511 1656 5157 37527",
    %%%     docstring       = "This file requires the use of chicago.sty.
    %%%
    %%%                        The checksum field above contains a CRC-16
    %%%                        checksum as the first value, followed by the
    %%%                        equivalent of the standard UNIX wc (word
    %%%                        count) utility output of lines, words, and
    %%%                        characters.  This is produced by Robert
    %%%                        Solovay's checksum utility."
    %%%  }
    %%% ====================================================================
    %
    % "Chicago" BibTeX style, chicago.bst
    % ===================================
    %
    % BibTeX `chicago' style file for BibTeX version 0.99c, LaTeX version 2.09
    % Place it in a file called chicago.bst in the BibTeX search path.
    % You need to include chicago.sty as a \documentstyle option.
    % (Placing it in the same directory as the LaTeX document should also work.)
    % This "chicago" style is based on newapa.bst (American Psych. Assoc.)
    % found at ymir.claremont.edu.
    %
    %   Citation format: (author-last-name year)
    %             (author-last-name and author-last-name year)
    %             (author-last-name, author-last-name, and author-last-name year)
    %             (author-last-name et al. year)
    %             (author-last-name)
    %             author-last-name (year)
    %             (author-last-name and author-last-name)
    %             (author-last-name et al.)
    %             (year) or (year,year)
    %             year or year,year
    %
    %   Reference list ordering: alphabetical by author or whatever passes
    %    for author in the absence of one.
    %
    % This BibTeX style has support for abbreviated author lists and for
    %    year-only citations.  This is done by having the citations
    %    actually look like
    %
    %    \citeauthoryear{full-author-info}{abbrev-author-info}{year}
    %
    % The LaTeX style has to have the following (or similar)
    %
    %     \let\@internalcite\cite
    %     \def\fullcite{\def\citeauthoryear##1##2##3{##1, ##3}\@internalcite}
    %     \def\fullciteA{\def\citeauthoryear##1##2##3{##1}\@internalcite}
    %     \def\shortcite{\def\citeauthoryear##1##2##3{##2, ##3}\@internalcite}
    %     \def\shortciteA{\def\citeauthoryear##1##2##3{##2}\@internalcite}
    %     \def\citeyear{\def\citeauthoryear##1##2##3{##3}\@internalcite}
    %
    % These TeX macro definitions are found in chicago.sty. Additional
    % commands to manipulate different components of a citation can be defined
    % so that, for example, you can list author's names without parentheses
    % if using a citation as a noun or object in a sentence.
    %
    % This file was originally copied from newapa.bst at ymir.claremont.edu.
    %
    % Features of chicago.bst:
    % =======================
    %
    % - full names used in citations, but abbreviated citations are available
    %   (see above)
    % - if an entry has a "month", then the month and year are also printed
    %   as part of that bibitem.
    % - all conjunctions use "and" instead of "\&"
    % - major modification from Chicago Manual of Style (13th ed.) is that
    %   only the first author in a reference appears last name first-
    %   additional authors appear as J. Q. Public.
    % - pages are listed as "pp. xx-xx" in all entry types except
    %   article entries.
    % - book, inbook, and manual use "location: publisher" (or organization)
    %   for address and publisher. All other types list publishers separately.
    % - "pp." are used to identify page numbers for all entry types except
    %   articles.
    % - organization is used as a citation label if neither author nor editor
    %   is present (for manuals).
    % - "et al." is used for long author and editor lists, or when "others"
    %   is used.
    %
    % Modifications and bug fixes from newapa.bst:
    % ===========================================
    %
    %   - added month, year to bib entries if month is present
    %   - fixed bug with In proceedings, added necessary comma after title
    %   - all conjunctions changed to "and" from "\&"
    %   - fixed bug with author labels in my.full.label: "et al." now is
    %        generated when "others" is an author name
    %   - major modification from Chicago Manual of Style (13th ed.) is that
    %     only the first author in a reference appears last name first-
    %     additional authors appear as J. Q. Public.
    %   - pages are listed as "pp. xx-xx" in all entry types except
    %     article entries. Unnecessary (IMHO) "()" around page numbers
    %     were removed, and page numbers now don't end with a period.
    %   - created chicago.sty for use with this bibstyle (required).
    %   - fixed bugs in FUNCTION {format.vol.num.pages} for missing volume,
    %     number, and /or pages. Renamed to format.jour.vol.
    %   - fixed bug in formatting booktitles: additional period an error if
    %     book has a volume.
    %   - fixed bug: editors usually given redundant period before next clause
    %     (format.editors.dot) removed.
    %   - added label support for organizations, if both author and editor
    %     are missing (from alpha.bst). If organization is too long, then
    %     the key field is used for abbreviated citations.
    %   - In proceedings or books of several volumes, no comma was written
    %     between the "Volume x" and the page numbers (this was intentional
    %     in newapa.bst). Fixed.
    %   - Some journals may not have volumes/numbers, only month/year (eg.
    %     IEEE Computer). Fixed bug in article style that assumed volume/number
    %     was always present.
    %
    % Original documentation for newapa.sty:
    % =====================================
    %
    % This version was made by modifying the master file made by
    % Oren Patashnik (PATASHNIK@SCORE.STANFORD.EDU), and the 'named' BibTeX
    % style of Peter F. Patel-Schneider.
    %
    % Copyright (C) 1985, all rights reserved.
    % Copying of this file is authorized only if either
    % (1) you make absolutely no changes to your copy, including name, or
    % (2) if you do make changes, you name it something other than 'newapa.bst'.
    % There are undoubtably bugs in this style.  If you make bug fixes,
    % improvements, etc.  please let me know.  My e-mail address is:
    %    spencer@cgrg.ohio.state.edu or 71160.3141@compuserve.com
    %
    % This style was made from 'plain.bst', 'named.bst', and 'apalike.bst',
    % with lots of tweaking to make it look like APA style, along with tips
    % from Young Ryu and Brian Reiser's modifications of 'apalike.bst'.

    ENTRY
      { address
        author
        booktitle
        chapter
        edition
        editor
        howpublished
        institution
        journal
        key
        month
        note
        number
        organization
        pages
        publisher
        school
        series
        title
        type
        volume
        year
      }
      {}
      { label.year extra.label sort.year sort.label }

    INTEGERS { output.state before.all mid.sentence after.sentence after.block }

    FUNCTION {init.state.consts}
    { #0 'before.all :=
      #1 'mid.sentence :=
      #2 'after.sentence :=
      #3 'after.block :=
    }

    STRINGS { s t u }

    FUNCTION {output.nonnull}
    { 's :=
      output.state mid.sentence =
        { ", " * write$ }
        { output.state after.block =
        { add.period$ write$
          newline$
          "\newblock " write$
        }
        { output.state before.all =
            'write$
            { add.period$ " " * write$ }
          if$
        }
          if$
          mid.sentence 'output.state :=
        }
      if$
      s
    }

    % Use a colon to separate output. Used only for address/publisher
    % combination in book/inbook types, address/institution for manuals,
    % and organization:publisher for proceedings (inproceedings).
    %
    FUNCTION {output.nonnull.colon}
    { 's :=
      output.state mid.sentence =
        { ": " * write$ }
        { output.state after.block =
        { add.period$ write$
          newline$
          "\newblock " write$
        }
        { output.state before.all =
            'write$
            { add.period$ " " * write$ }
          if$
        }
          if$
          mid.sentence 'output.state :=
        }
      if$
      s
    }

    FUNCTION {output}
    { duplicate$ empty$
        'pop$
        'output.nonnull
      if$
    }

    FUNCTION {output.colon}
    { duplicate$ empty$
        'pop$
        'output.nonnull.colon
      if$
    }

    FUNCTION {output.check}
    { 't :=
      duplicate$ empty$
        { pop$ "empty " t * " in " * cite$ * warning$ }
        'output.nonnull
      if$
    }

    FUNCTION {output.check.colon}
    { 't :=
      duplicate$ empty$
        { pop$ "empty " t * " in " * cite$ * warning$ }
        'output.nonnull.colon
      if$
    }

    FUNCTION {output.year.check}
    { year empty$
         { "empty year in " cite$ * warning$ }
         { write$
            " (" year * extra.label *
           month empty$
              { ")" * }
              { ", " * month * ")" * }
           if$
           mid.sentence 'output.state :=
         }
      if$
    }


    FUNCTION {fin.entry}
    { add.period$
      write$
      newline$
    }

    FUNCTION {new.block}
    { output.state before.all =
        'skip$
        { after.block 'output.state := }
      if$
    }

    FUNCTION {new.sentence}
    { output.state after.block =
        'skip$
        { output.state before.all =
        'skip$
        { after.sentence 'output.state := }
          if$
        }
      if$
    }

    FUNCTION {not}
    {   { #0 }
        { #1 }
      if$
    }

    FUNCTION {and}
    {   'skip$
        { pop$ #0 }
      if$
    }

    FUNCTION {or}
    {   { pop$ #1 }
        'skip$
      if$
    }

    FUNCTION {new.block.checka}
    { empty$
        'skip$
        'new.block
      if$
    }

    FUNCTION {new.block.checkb}
    { empty$
      swap$ empty$
      and
        'skip$
        'new.block
      if$
    }

    FUNCTION {new.sentence.checka}
    { empty$
        'skip$
        'new.sentence
      if$
    }

    FUNCTION {new.sentence.checkb}
    { empty$
      swap$ empty$
      and
        'skip$
        'new.sentence
      if$
    }

    FUNCTION {field.or.null}
    { duplicate$ empty$
        { pop$ "" }
        'skip$
      if$
    }

    %
    % Emphasize the top string on the stack.
    %
    FUNCTION {emphasize}
    { duplicate$ empty$
        { pop$ "" }
        { "{\em " swap$ * "}" * }
      if$
    }

    %
    % Emphasize the top string on the stack, but add a trailing space.
    %
    FUNCTION {emphasize.space}
    { duplicate$ empty$
        { pop$ "" }
        { "{\em " swap$ * "\/}" * }
      if$
    }

    INTEGERS { nameptr namesleft numnames }
    %
    % Format bibliographical entries with the first author last name first,
    % and subsequent authors with initials followed by last name.
    % All names are formatted in this routine.
    %
    FUNCTION {format.names}
    { 's :=
      #1 'nameptr :=               % nameptr = 1;
      s num.names$ 'numnames :=    % numnames = num.name$(s);
      numnames 'namesleft :=
        { namesleft #0 > }

        { nameptr #1 =
            {s nameptr "{vv~}{ll}{, jj}{, ff}" format.name$ 't := }
            {s nameptr "{ff~}{vv~}{ll}{, jj}" format.name$ 't := }
          if$
          nameptr #1 >
            { namesleft #1 >
                  { ", " * t * }
                  { numnames #2 >
                      { "," * }
                      'skip$
                    if$
                    t "others" =
                        { " et~al." * }
                        { " and " * t * } % from Chicago Manual of Style
                      if$
                   }
                   if$
                 }
                't
            if$
            nameptr #1 + 'nameptr :=          % nameptr += 1;
            namesleft #1 - 'namesleft :=      % namesleft =- 1;
        }
      while$
    }

    FUNCTION {my.full.label}
    { 's :=
      #1 'nameptr :=               % nameptr = 1;
      s num.names$ 'numnames :=    % numnames = num.name$(s);
      numnames 'namesleft :=
        { namesleft #0 > }

        { s nameptr "{vv~}{ll}" format.name$ 't :=  % get the next name
          nameptr #1 >
            { namesleft #1 >
                  { ", " * t * }
                  { numnames #2 >
                      { "," * }
                      'skip$
                    if$
                    t "others" =
                        { " et~al." * }
                        { " and " * t * } % from Chicago Manual of Style
                      if$
                   }
                   if$
                 }
                't
            if$
            nameptr #1 + 'nameptr :=          % nameptr += 1;
            namesleft #1 - 'namesleft :=      % namesleft =- 1;
        }
      while$

    }

    FUNCTION {format.names.fml}
    %
    % Format names in "familiar" format, with first initial followed by
    % last name. Like format.names, ALL names are formatted.
    %
    { 's :=
      #1 'nameptr :=               % nameptr = 1;
      s num.names$ 'numnames :=    % numnames = num.name$(s);
      numnames 'namesleft :=
        { namesleft #0 > }

        { s nameptr "{ff~}{vv~}{ll}{, jj}" format.name$ 't :=

          nameptr #1 >
            { namesleft #1 >
                  { ", " * t * }
                   { numnames #2 >
                        { "," * }
                        'skip$
                      if$
                      t "others" =
                            { " et~al." * }
                            { " and " * t * }
    %                       { " \& " * t * }
                          if$
                    }
                   if$
                 }
                't
            if$
            nameptr #1 + 'nameptr :=          % nameptr += 1;
            namesleft #1 - 'namesleft :=      % namesleft =- 1;
        }
      while$
    }

    FUNCTION {format.authors}
    { author empty$
        { "" }
        { author format.names }
      if$
    }

    FUNCTION {format.key}
    { empty$
        { key field.or.null }
        { "" }
      if$
    }

    %
    % Format editor names for use in the "in" types: inbook, incollection,
    % inproceedings: first initial, then last names. When editors are the
    % LABEL for an entry, then format.editor is used which lists editors
    % by last name first.
    %
    FUNCTION {format.editors.fml}
    { editor empty$
        { "" }
        { editor format.names.fml
          editor num.names$ #1 >
        { " (Eds.)" * }
        { " (Ed.)" * }
          if$
        }
      if$
    }

    %
    % Format editor names for use in labels, last names first.
    %
    FUNCTION {format.editors}
    { editor empty$
        { "" }
        { editor format.names
          editor num.names$ #1 >
        { " (Eds.)" * }
        { " (Ed.)" * }
          if$
        }
      if$
    }

    FUNCTION {format.title}
    { title empty$
        { "" }
        { title "t" change.case$ }
      if$
    }

    % Note that the APA style requres case changes
    % in article titles. The following does not
    % change cases. If you perfer it, uncomment the
    % following and comment out the above.

    %FUNCTION {format.title}
    %{ title empty$
    %    { "" }
    %    { title }
    %  if$
    %}

    FUNCTION {n.dashify}
    { 't :=
      ""
        { t empty$ not }
        { t #1 #1 substring$ "-" =
        { t #1 #2 substring$ "--" = not
            { "--" *
              t #2 global.max$ substring$ 't :=
            }
            {   { t #1 #1 substring$ "-" = }
            { "-" *
              t #2 global.max$ substring$ 't :=
            }
              while$
            }
          if$
        }
        { t #1 #1 substring$ *
          t #2 global.max$ substring$ 't :=
        }
          if$
        }
      while$
    }

    FUNCTION {format.btitle}
    { edition empty$
      { title emphasize }
      { title empty$
        { title emphasize }
        { volume empty$     % gnp - check for volume, then don't need period
           { "{\em " title * "\/} (" * edition * " ed.)" * "." * }
           { "{\em " title * "\/} (" * edition * " ed.)" * }
          if$
        }
        if$
      }
      if$
    }

    FUNCTION {format.emphasize.booktitle}
    { edition empty$
      { booktitle emphasize }
      { booktitle empty$
        { booktitle emphasize }
        { volume empty$    % gnp - extra period an error if book has a volume
            { "{\em " booktitle * "\/} (" * edition * " ed.)" * "." *}
            { "{\em " booktitle * "\/} (" * edition * " ed.)" * }
          if$
          }
        if$
        }
      if$
      }


    FUNCTION {tie.or.space.connect}
    { duplicate$ text.length$ #3 <
        { "~" }
        { " " }
      if$
      swap$ * *
    }

    FUNCTION {either.or.check}
    { empty$
        'pop$
        { "can't use both " swap$ * " fields in " * cite$ * warning$ }
      if$
    }

    FUNCTION {format.bvolume}
    { volume empty$
        { "" }
        { "Volume" volume tie.or.space.connect % gnp - changed to mixed case
          series empty$
            'skip$
            { " of " * series emphasize * }
          if$
          "volume and number" number either.or.check
        }
      if$
    }

    FUNCTION {format.number.series}
    { volume empty$
        { number empty$
        { series field.or.null }
        { output.state mid.sentence =
            { "Number" } % gnp - changed to mixed case always
            { "Number" }
          if$
          number tie.or.space.connect
          series empty$
            { "there's a number but no series in " cite$ * warning$ }
            { " in " * series * }
          if$
        }
          if$
        }
        { "" }
      if$
    }

    INTEGERS { multiresult }

    FUNCTION {multi.page.check}
    { 't :=
      #0 'multiresult :=
        { multiresult not
          t empty$ not
          and
        }
        { t #1 #1 substring$
          duplicate$ "-" =
          swap$ duplicate$ "," =
          swap$ "+" =
          or or
        { #1 'multiresult := }
        { t #2 global.max$ substring$ 't := }
          if$
        }
      while$
      multiresult
    }

    FUNCTION {format.pages}
    { pages empty$
      { "" }
      { pages multi.page.check
    	{ "pp.\ " pages n.dashify tie.or.space.connect } % gnp - removed ()
    	{ "pp.\ " pages tie.or.space.connect }
        if$
      }
      if$
    }

    % By Young (and Spencer)
    % GNP - fixed bugs with missing volume, number, and/or pages
    %
    % Format journal, volume, number, pages for article types.
    %
    FUNCTION {format.jour.vol}
    { journal empty$
        { "no journal in " cite$ * warning$
          "" }
        { journal emphasize.space }
        if$
      number empty$
        { volume empty$
           { "no number and no volume in " cite$ * warning$
             "" * }
           { " {\em " * Volume * "}" * }
          if$
        }
        { volume empty$
          {"no volume for " cite$ * warning$
           "~(" * number * ")" * }
          { "~" *
            volume emphasize.space
            "(" * number * ")" * * }
          if$
        }
      if$
      pages empty$
        {"page numbers missing in " cite$ * warning$
         "" * } % gnp - place a null string on the stack for output
        { duplicate$ empty$
          { pop$ format.pages }
          { ", " *  pages n.dashify * } % gnp - removed pp. for articles
          if$
        }
      if$
    }

    FUNCTION {format.chapter.pages}
    { chapter empty$
        'format.pages
        { type empty$
            { "Chapter" } % gnp - changed to mixed case
            { type "t" change.case$ }
          if$
          chapter tie.or.space.connect
          pages empty$
            {"page numbers missing in " cite$ * warning$} % gnp - added check
            { ", " * format.pages * }
          if$
        }
      if$
    }

    FUNCTION {format.in.ed.booktitle}
    { booktitle empty$
      { "" }
      { editor empty$
        { "In " format.emphasize.booktitle * }
        { "In " format.editors.fml * ", " * format.emphasize.booktitle * }
        if$
      }
      if$
    }

    FUNCTION {format.thesis.type}
    { type empty$
        'skip$
        { pop$
          type "t" change.case$
        }
      if$
    }

    FUNCTION {format.tr.number}
    { type empty$
        { "Technical Report" }
        'type
      if$
      number empty$
        { "t" change.case$ }
        { number tie.or.space.connect }
      if$
    }

    FUNCTION {format.article.crossref}
    { "See"
      "\citeN{" * crossref * "}" *
    }

    FUNCTION {format.crossref.editor}
    { editor #1 "{vv~}{ll}" format.name$
      editor num.names$ duplicate$
      #2 >
        { pop$ " et~al." * }
        { #2 <
        'skip$
        { editor #2 "{ff }{vv }{ll}{ jj}" format.name$ "others" =
            { " et~al." * }
            { " and " * editor #2 "{vv~}{ll}" format.name$ * }
          if$
        }
          if$
        }
      if$
    }

    FUNCTION {format.book.crossref}
    { volume empty$
        { "empty volume in " cite$ * "'s crossref of " * crossref * warning$
          "In "
        }
        { "Volume" volume tie.or.space.connect % gnp - changed to mixed case
          " of " *
        }
      if$
      editor empty$
      editor field.or.null author field.or.null =
      or
        { key empty$
        { series empty$
            { "need editor, key, or series for " cite$ * " to crossref " *
              crossref * warning$
              "" *
            }
            { "{\em " * series * "\/}" * }
          if$
        }
        { key * }
          if$
        }
        { format.crossref.editor * }
      if$
      " \citeN{" * crossref * "}" *
    }

    FUNCTION {format.incoll.inproc.crossref}
    { "See"
      " \citeN{" * crossref * "}" *
    }

    % format.lab.names:
    %
    % determines "short" names for the abbreviated author information.
    % "Long" labels are created in calc.label, using the routine my.full.label
    % to format author and editor fields.
    %
    % There are 4 cases for labels.   (n=3 in the example)
    % a) one author             Foo
    % b) one to n               Foo, Bar and Baz
    % c) use of "and others"    Foo, Bar et al.
    % d) more than n            Foo et al.
    %
    FUNCTION {format.lab.names}
    { 's :=
      s num.names$ 'numnames :=
      numnames #2 >    % change number to number of others allowed before
    		   % forcing "et al".
        { s #1 "{vv~}{ll}" format.name$ " et~al." * }
        {
          numnames #1 - 'namesleft :=
          #2 'nameptr :=
          s #1 "{vv~}{ll}" format.name$
    	{ namesleft #0 > }
    	{ nameptr numnames =
    	    { s nameptr "{ff }{vv }{ll}{ jj}" format.name$ "others" =
    		{ " et~al." * }
    		{ " and " * s nameptr "{vv~}{ll}" format.name$ * }
    	      if$
    	    }
    	    { ", " * s nameptr "{vv~}{ll}" format.name$ * }
    	  if$
    	  nameptr #1 + 'nameptr :=
    	  namesleft #1 - 'namesleft :=
    	}
          while$
        }
      if$
    }

    FUNCTION {author.key.label}
    { author empty$
        { key empty$
              { "no key, author in " cite$ * warning$
                cite$ #1 #3 substring$ }
             'key
          if$
        }
        { author format.lab.names }
      if$
    }

    FUNCTION {editor.key.label}
    { editor empty$
        { key empty$
              { "no key, editor in " cite$ * warning$
                cite$ #1 #3 substring$ }
              'key
            if$
         }
         { editor format.lab.names }
      if$
    }

    FUNCTION {author.key.organization.label}
    %
    % added - gnp. Provide label formatting by organization if author is null.
    %
    { author empty$
        { organization empty$
    	{ key empty$
    	    { "no key, author or organization in " cite$ * warning$
                  cite$ #1 #3 substring$ }
    	    'key
    	  if$
    	}
            { organization }
          if$
        }
        { author format.lab.names }
      if$
    }

    FUNCTION {editor.key.organization.label}
    %
    % added - gnp. Provide label formatting by organization if editor is null.
    %
    { editor empty$
        { organization empty$
    	{ key empty$
    	    { "no key, editor or organization in " cite$ * warning$
                  cite$ #1 #3 substring$ }
    	    'key
    	  if$
    	}
            { organization }
          if$
        }
        { editor format.lab.names }
      if$
    }

    FUNCTION {author.editor.key.label}
    { author empty$
        { editor empty$
              { key empty$
                   { "no key, author, or editor in " cite$ * warning$
                     cite$ #1 #3 substring$ }
                 'key
               if$
             }
              { editor format.lab.names }
          if$
        }
        { author format.lab.names }
      if$
    }

    FUNCTION {calc.label}
    %
    % Changed - GNP. See also author.organization.sort, editor.organization.sort
    % Form label for BibTeX entry. The classification of which fields are used
    % for which type of entry (book, inbook, etc.) are taken from alpha.bst.
    % The change here from newapa is to also include organization as a
    % citation label if author or editor is missing.
    %
    { type$ "book" =
      type$ "inbook" =
      or
        'author.editor.key.label
        { type$ "proceedings" =
    	'editor.key.organization.label
    	{ type$ "manual" =
    	    'author.key.organization.label
    	    'author.key.label
    	  if$
    	}
          if$
        }
      if$

      author empty$  % generate the full label citation information.
        { editor empty$
            { organization empty$
               { "no author, editor, or organization in " cite$ * warning$
                 "??" }
               { organization }
               if$
            }
            { editor my.full.label }
            if$
        }
        { author my.full.label }
      if$

    % leave label on the stack, to be popped when required.

      "}{" * swap$ * "}{" *
    %  year field.or.null purify$ #-1 #4 substring$ *
    %
    % save the year for sort processing afterwards (adding a, b, c, etc.)
    %
      year field.or.null purify$ #-1 #4 substring$
      'label.year :=
    }

    FUNCTION {output.bibitem}
    { newline$

      "\bibitem[\protect\citeauthoryear{" write$
      calc.label write$
      sort.year write$
      "}]{" write$

      cite$ write$
      "}" write$
      newline$
      ""
      before.all 'output.state :=
    }

    FUNCTION {article}
    { output.bibitem
      format.authors
      "author" output.check
      author format.key output          % added
      output.year.check                 % added
      new.block
      format.title
      "title" output.check
      new.block
      crossref missing$
        { format.jour.vol output
        }
        { format.article.crossref output.nonnull
          format.pages output
        }
      if$
      new.block
      note output
      fin.entry
    }

    FUNCTION {book}
    { output.bibitem
      author empty$
        { format.editors
    	  "author and editor" output.check }
        { format.authors
    	  output.nonnull
          crossref missing$
        	{ "author and editor" editor either.or.check }
        	'skip$
          if$
        }
      if$
      output.year.check       % added
      new.block
      format.btitle
      "title" output.check
      crossref missing$
        { format.bvolume output
          new.block
          format.number.series output
          new.sentence
          address output
          publisher "publisher" output.check.colon
        }
        { new.block
          format.book.crossref output.nonnull
        }
      if$
      new.block
      note output
      fin.entry
    }

    FUNCTION {booklet}
    { output.bibitem
      format.authors output
      author format.key output          % added
      output.year.check                 % added
      new.block
      format.title
      "title" output.check
      new.block
      howpublished output
      address output
      new.block
      note output
      fin.entry
    }

    FUNCTION {inbook}
    { output.bibitem
      author empty$
        { format.editors
          "author and editor" output.check
        }
        { format.authors output.nonnull
          crossref missing$
        { "author and editor" editor either.or.check }
        'skip$
          if$
        }
      if$
      output.year.check                 % added
      new.block
      format.btitle
      "title" output.check
      crossref missing$
        { format.bvolume output
          format.chapter.pages
          "chapter and pages" output.check
          new.block
          format.number.series output
          new.sentence
          address output
          publisher
          "publisher" output.check.colon
        }
        { format.chapter.pages "chapter and pages" output.check
          new.block
          format.book.crossref output.nonnull
        }
      if$
      new.block
      note output
      fin.entry
    }

    FUNCTION {incollection}
    { output.bibitem
      format.authors
      "author" output.check
      author format.key output       % added
      output.year.check              % added
      new.block
      format.title
      "title" output.check
      new.block
      crossref missing$
      { format.in.ed.booktitle
        "booktitle" output.check
        format.bvolume output
        format.number.series output
        format.chapter.pages output % gnp - was special.output.nonnull
    %                                 left out comma before page numbers
        new.sentence
        address output
        publisher "publisher" output.check.colon
      }
      { format.incoll.inproc.crossref
    	output.nonnull
        format.chapter.pages output
      }
      if$
      new.block
      note output
      fin.entry
    }

    FUNCTION {inproceedings}
    { output.bibitem
      format.authors
      "author" output.check
      author format.key output            % added
      output.year.check                   % added
      new.block
      format.title
      "title" output.check
      new.block
      crossref missing$
        { format.in.ed.booktitle
    	  "booktitle" output.check
          format.bvolume output
          format.number.series output
          address output
          format.pages output
          new.sentence
          organization output
          publisher output.colon
          }
        { format.incoll.inproc.crossref output.nonnull
          format.pages output
        }
      if$
      new.block
      note output
      fin.entry
    }

    FUNCTION {conference} { inproceedings }

    FUNCTION {manual}
    { output.bibitem
      author empty$
        { editor empty$
          { organization "organization" output.check
            organization format.key output }  % if all else fails, use key
          { format.editors "author and editor" output.check }
          if$
        }
        { format.authors output.nonnull }
        if$
      output.year.check                 % added
      new.block
      format.btitle
      "title" output.check
      organization address new.block.checkb
    % Reversed the order of "address" and "organization", added the ":".
      address output
      organization "organization" output.check.colon
    %  address output
    %  ":" output
    %  organization output
      new.block
      note output
      fin.entry
    }

    FUNCTION {mastersthesis}
    { output.bibitem
      format.authors
      "author" output.check
      author format.key output          % added
      output.year.check                 % added
      new.block
      format.title
      "title" output.check
      new.block
      "Master's thesis" format.thesis.type output.nonnull
      school "school" output.check
      address output
      new.block
      note output
      fin.entry
    }

    FUNCTION {misc}
    { output.bibitem
      format.authors output
      author format.key output            % added
      output.year.check                   % added
      title howpublished new.block.checkb
      format.title output
      new.block
      howpublished output
      new.block
      note output
      fin.entry
    }

    FUNCTION {phdthesis}
    { output.bibitem
      format.authors
      "author" output.check
      author format.key output            % added
      output.year.check                   % added
      new.block
      format.btitle
      "title" output.check
      new.block
      "Ph.\ D. thesis" format.thesis.type output.nonnull
      school "school" output.check
      address output
      new.block
      note output
      fin.entry
    }

    FUNCTION {proceedings}
    { output.bibitem
      editor empty$
        { organization output
          organization format.key output }  % gnp - changed from author format.key
        { format.editors output.nonnull }
      if$
    % author format.key output             % gnp - removed (should be either
    %                                        editor or organization
      output.year.check                    % added (newapa)
      new.block
      format.btitle
      "title" output.check
      format.bvolume output
      format.number.series output
      address output
      new.sentence
      organization output
      publisher output.colon
      new.block
      note output
      fin.entry
    }

    FUNCTION {techreport}
    { output.bibitem
      format.authors
      "author" output.check
      author format.key output             % added
      output.year.check                    % added
      new.block
      format.title
      "title" output.check
      new.block
      format.tr.number output.nonnull
      institution
      "institution" output.check
      address output
      new.block
      note output
      fin.entry
    }

    FUNCTION {unpublished}
    { output.bibitem
      format.authors
      "author" output.check
      author format.key output              % added
      output.year.check                      % added
      new.block
      format.title
      "title" output.check
      new.block
      note "note" output.check
      fin.entry
    }

    FUNCTION {default.type} { misc }

    MACRO {jan} {"January"}

    MACRO {feb} {"February"}

    MACRO {mar} {"March"}

    MACRO {apr} {"April"}

    MACRO {may} {"May"}

    MACRO {jun} {"June"}

    MACRO {jul} {"July"}

    MACRO {aug} {"August"}

    MACRO {sep} {"September"}

    MACRO {oct} {"October"}

    MACRO {nov} {"November"}

    MACRO {dec} {"December"}

    MACRO {acmcs} {"ACM Computing Surveys"}

    MACRO {acta} {"Acta Informatica"}

    MACRO {ai} {"Artificial Intelligence"}

    MACRO {cacm} {"Communications of the ACM"}

    MACRO {ibmjrd} {"IBM Journal of Research and Development"}

    MACRO {ibmsj} {"IBM Systems Journal"}

    MACRO {ieeese} {"IEEE Transactions on Software Engineering"}

    MACRO {ieeetc} {"IEEE Transactions on Computers"}

    MACRO {ieeetcad}
     {"IEEE Transactions on Computer-Aided Design of Integrated Circuits"}

    MACRO {ipl} {"Information Processing Letters"}

    MACRO {jacm} {"Journal of the ACM"}

    MACRO {jcss} {"Journal of Computer and System Sciences"}

    MACRO {scp} {"Science of Computer Programming"}

    MACRO {sicomp} {"SIAM Journal on Computing"}

    MACRO {tocs} {"ACM Transactions on Computer Systems"}

    MACRO {tods} {"ACM Transactions on Database Systems"}

    MACRO {tog} {"ACM Transactions on Graphics"}

    MACRO {toms} {"ACM Transactions on Mathematical Software"}

    MACRO {toois} {"ACM Transactions on Office Information Systems"}

    MACRO {toplas} {"ACM Transactions on Programming Languages and Systems"}

    MACRO {tcs} {"Theoretical Computer Science"}

    READ

    FUNCTION {sortify}
    { purify$
      "l" change.case$
    }

    INTEGERS { len }

    FUNCTION {chop.word}
    { 's :=
      'len :=
      s #1 len substring$ =
        { s len #1 + global.max$ substring$ }
        's
      if$
    }



    FUNCTION {sort.format.names}
    { 's :=
      #1 'nameptr :=
      ""
      s num.names$ 'numnames :=
      numnames 'namesleft :=
        { namesleft #0 > }
        { nameptr #1 >
              { "   " * }
             'skip$
          if$
          s nameptr "{ll{ }}{  f{ }}{  jj{ }}" format.name$ 't :=
          nameptr numnames = t "others" = and
              { " et~al" * }
              { t sortify * }
          if$
          nameptr #1 + 'nameptr :=
          namesleft #1 - 'namesleft :=
        }
      while$
    }

    FUNCTION {sort.format.title}
    { 't :=
      "A " #2
        "An " #3
          "The " #4 t chop.word
        chop.word
      chop.word
      sortify
      #1 global.max$ substring$
    }

    FUNCTION {author.sort}
    { author empty$
        { key empty$
             { "to sort, need author or key in " cite$ * warning$
               "" }
             { key sortify }
          if$
        }
        { author sort.format.names }
      if$
    }

    FUNCTION {editor.sort}
    { editor empty$
        { key empty$
             { "to sort, need editor or key in " cite$ * warning$
               ""
             }
             { key sortify }
          if$
        }
        { editor sort.format.names }
      if$
    }

    FUNCTION {author.editor.sort}
    { author empty$
        { "missing author in " cite$ * warning$
          editor empty$
             { key empty$
                 { "to sort, need author, editor, or key in " cite$ * warning$
                   ""
                 }
                 { key sortify }
               if$
             }
             { editor sort.format.names }
          if$
        }
        { author sort.format.names }
      if$
    }

    FUNCTION {author.organization.sort}
    %
    % added - GNP. Stack author or organization for sorting (from alpha.bst).
    % Unlike alpha.bst, we need entire names, not abbreviations
    %
    { author empty$
        { organization empty$
    	{ key empty$
    	    { "to sort, need author, organization, or key in " cite$ * warning$
    	      ""
    	    }
    	    { key sortify }
    	  if$
    	}
    	{ organization sortify }
          if$
        }
        { author sort.format.names }
      if$
    }

    FUNCTION {editor.organization.sort}
    %
    % added - GNP. Stack editor or organization for sorting (from alpha.bst).
    % Unlike alpha.bst, we need entire names, not abbreviations
    %
    { editor empty$
        { organization empty$
    	{ key empty$
    	    { "to sort, need editor, organization, or key in " cite$ * warning$
    	      ""
    	    }
    	    { key sortify }
    	  if$
    	}
    	{ organization sortify }
          if$
        }
        { editor sort.format.names }
      if$
    }

    FUNCTION {presort}
    %
    % Presort creates the bibentry's label via a call to calc.label, and then
    % sorts the entries based on entry type. Chicago.bst adds support for
    % including organizations as the sort key; the following is stolen from
    % alpha.bst.
    %
    { calc.label sortify % recalculate bibitem label
      year field.or.null purify$ #-1 #4 substring$ * % add year
      "    "
      *
      type$ "book" =
      type$ "inbook" =
      or
        'author.editor.sort
        { type$ "proceedings" =
    	'editor.organization.sort
    	{ type$ "manual" =
    	    'author.organization.sort
    	    'author.sort
    	  if$
    	}
          if$
        }
      if$
      #1 entry.max$ substring$        % added for newapa
      'sort.label :=                  % added for newapa
      sort.label                      % added for newapa
      *
      "    "
      *
      title field.or.null
      sort.format.title
      *
      #1 entry.max$ substring$
      'sort.key$ :=
    }

    ITERATE {presort}

    SORT             % by label, year, author/editor, title

    STRINGS { last.label next.extra }

    INTEGERS { last.extra.num }

    FUNCTION {initialize.extra.label.stuff}
    { #0 int.to.chr$ 'last.label :=
      "" 'next.extra :=
      #0 'last.extra.num :=
    }

    FUNCTION {forward.pass}
    %
    % Pass through all entries, comparing current entry to last one.
    % Need to concatenate year to the stack (done by calc.label) to determine
    % if two entries are the same (see presort)
    %
    { last.label
      calc.label year field.or.null purify$ #-1 #4 substring$ * % add year
      #1 entry.max$ substring$ =     % are they equal?
         { last.extra.num #1 + 'last.extra.num :=
           last.extra.num int.to.chr$ 'extra.label :=
         }
         { "a" chr.to.int$ 'last.extra.num :=
           "" 'extra.label :=
           calc.label year field.or.null purify$ #-1 #4 substring$ * % add year
           #1 entry.max$ substring$ 'last.label := % assign to last.label
         }
      if$
    }

    FUNCTION {reverse.pass}
    { next.extra "b" =
        { "a" 'extra.label := }
         'skip$
      if$
      label.year extra.label * 'sort.year :=
      extra.label 'next.extra :=
    }

    EXECUTE {initialize.extra.label.stuff}

    ITERATE {forward.pass}

    REVERSE {reverse.pass}

    FUNCTION {bib.sort.order}
    { sort.label
      "    "
      *
      year field.or.null sortify
      *
      "    "
      *
      title field.or.null
      sort.format.title
      *
      #1 entry.max$ substring$
      'sort.key$ :=
    }

    ITERATE {bib.sort.order}

    SORT             % by sort.label, year, title --- giving final bib. order.

    FUNCTION {begin.bib}

    { preamble$ empty$
        'skip$
        { preamble$ write$ newline$ }
      if$
      "\begin{thebibliography}{}" write$ newline$
    }


    EXECUTE {begin.bib}

    EXECUTE {init.state.consts}

    ITERATE {call.type$}

    FUNCTION {end.bib}
    { newline$
      "\end{thebibliography}" write$ newline$
    }

    EXECUTE {end.bib}


  '';
  home.file.".texmf/tex/latex/rug-econometrics/natbib.sty".text = ''
    %%
    %% This is file `natbib.sty',
    %% generated with the docstrip utility.
    %%
    %% The original source files were:
    %%
    %% natbib.dtx  (with options: `package,all')
    %% =============================================
    %% IMPORTANT NOTICE:
    %%
    %% This program can be redistributed and/or modified under the terms
    %% of the LaTeX Project Public License Distributed from CTAN
    %% archives in directory macros/latex/base/lppl.txt; either
    %% version 1 of the License, or any later version.
    %%
    %% This is a generated file.
    %% It may not be distributed without the original source file natbib.dtx.
    %%
    %% Full documentation can be obtained by LaTeXing that original file.
    %% Only a few abbreviated comments remain here to describe the usage.
    %% =============================================
    %% Copyright 1993-2003 Patrick W Daly
    %% Max-Planck-Institut f\"ur Aeronomie
    %% Max-Planck-Str. 2
    %% D-37191 Katlenburg-Lindau
    %% Germany
    %% E-mail: daly@linmpi.mpg.de
    \NeedsTeXFormat{LaTeX2e}[1995/06/01]
    \ProvidesPackage{natbib}
            [2003/06/06 7.1 (PWD)]
     % This package reimplements the LaTeX \cite command to be used for various
     % citation styles, both author-year and numerical. It accepts BibTeX
     % output intended for many other packages, and therefore acts as a
     % general, all-purpose citation-style interface.
     %
     % With standard numerical .bst files, only numerical citations are
     % possible. With an author-year .bst file, both numerical and
     % author-year citations are possible.
     %
     % If author-year citations are selected, \bibitem must have one of the
     %   following forms:
     %   \bibitem[Jones et al.(1990)]{key}...
     %   \bibitem[Jones et al.(1990)Jones, Baker, and Williams]{key}...
     %   \bibitem[Jones et al., 1990]{key}...
     %   \bibitem[\protect\citeauthoryear{Jones, Baker, and Williams}{Jones
     %       et al.}{1990}]{key}...
     %   \bibitem[\protect\citeauthoryear{Jones et al.}{1990}]{key}...
     %   \bibitem[\protect\astroncite{Jones et al.}{1990}]{key}...
     %   \bibitem[\protect\citename{Jones et al., }1990]{key}...
     %   \harvarditem[Jones et al.]{Jones, Baker, and Williams}{1990}{key}...
     %
     % This is either to be made up manually, or to be generated by an
     % appropriate .bst file with BibTeX.
     %                            Author-year mode     ||   Numerical mode
     % Then, \citet{key}  ==>>  Jones et al. (1990)    ||   Jones et al. [21]
     %       \citep{key}  ==>> (Jones et al., 1990)    ||   [21]
     % Multiple citations as normal:
     % \citep{key1,key2}  ==>> (Jones et al., 1990; Smith, 1989) || [21,24]
     %                           or  (Jones et al., 1990, 1991)  || [21,24]
     %                           or  (Jones et al., 1990a,b)     || [21,24]
     % \cite{key} is the equivalent of \citet{key} in author-year mode
     %                         and  of \citep{key} in numerical mode
     % Full author lists may be forced with \citet* or \citep*, e.g.
     %       \citep*{key}      ==>> (Jones, Baker, and Williams, 1990)
     % Optional notes as:
     %   \citep[chap. 2]{key}    ==>> (Jones et al., 1990, chap. 2)
     %   \citep[e.g.,][]{key}    ==>> (e.g., Jones et al., 1990)
     %   \citep[see][pg. 34]{key}==>> (see Jones et al., 1990, pg. 34)
     %  (Note: in standard LaTeX, only one note is allowed, after the ref.
     %   Here, one note is like the standard, two make pre- and post-notes.)
     %   \citealt{key}          ==>> Jones et al. 1990
     %   \citealt*{key}         ==>> Jones, Baker, and Williams 1990
     %   \citealp{key}          ==>> Jones et al., 1990
     %   \citealp*{key}         ==>> Jones, Baker, and Williams, 1990
     % Additional citation possibilities (both author-year and numerical modes)
     %   \citeauthor{key}       ==>> Jones et al.
     %   \citeauthor*{key}      ==>> Jones, Baker, and Williams
     %   \citeyear{key}         ==>> 1990
     %   \citeyearpar{key}      ==>> (1990)
     %   \citetext{priv. comm.} ==>> (priv. comm.)
     % Note: full author lists depends on whether the bib style supports them;
     %       if not, the abbreviated list is printed even when full requested.
     %
     % For names like della Robbia at the start of a sentence, use
     %   \Citet{dRob98}         ==>> Della Robbia (1998)
     %   \Citep{dRob98}         ==>> (Della Robbia, 1998)
     %   \Citeauthor{dRob98}    ==>> Della Robbia
     %
     %
     % Citation aliasing is achieved with
     %   \defcitealias{key}{text}
     %   \citetalias{key}  ==>> text
     %   \citepalias{key}  ==>> (text)
     %
     % Defining the citation style of a given bib style:
     % Use \bibpunct (in the preamble only) with 6 mandatory arguments:
     %    1. opening bracket for citation
     %    2. closing bracket
     %    3. citation separator (for multiple citations in one \cite)
     %    4. the letter n for numerical styles, s for superscripts
     %        else anything for author-year
     %    5. punctuation between authors and date
     %    6. punctuation between years (or numbers) when common authors missing
     % One optional argument is the character coming before post-notes. It
     %   appears in square braces before all other arguments. May be left off.
     % Example (and default) \bibpunct[, ]{(}{)}{;}{a}{,}{,}
     %
     % To make this automatic for a given bib style, named newbib, say, make
     % a local configuration file, natbib.cfg, with the definition
     %   \newcommand{\bibstyle@newbib}{\bibpunct...}
     % Then the \bibliographystyle{newbib} will cause \bibstyle@newbib to
     % be called on THE NEXT LATEX RUN (via the aux file).
     %
     % Such preprogrammed definitions may be invoked in the text (preamble only)
     %  by calling \citestyle{newbib}. This is only useful if the style specified
     %  differs from that in \bibliographystyle.
     %
     % With \citeindextrue and \citeindexfalse, one can control whether the
     % \cite commands make an automatic entry of the citation in the .idx
     % indexing file. For this, \makeindex must also be given in the preamble.
     %
     % LaTeX2e Options: (for selecting punctuation)
     %   round  -  round parentheses are used (default)
     %   square -  square brackets are used   [option]
     %   curly  -  curly braces are used      {option}
     %   angle  -  angle brackets are used    <option>
     %   colon  -  multiple citations separated by colon (default)
     %   comma  -  separated by comma
     %   authoryear - selects author-year citations (default)
     %   numbers-  selects numerical citations
     %   super  -  numerical citations as superscripts
     %   sort   -  sorts multiple citations according to order in ref. list
     %   sort&compress   -  like sort, but also compresses numerical citations
     %   longnamesfirst  -  makes first citation full author list
     %   sectionbib - puts bibliography in a \section* instead of \chapter*
     % Punctuation so selected dominates over any predefined ones.
     % LaTeX2e options are called as, e.g.
     %        \usepackage[square,comma]{natbib}
     % LaTeX the source file natbib.dtx to obtain more details
     % or the file natnotes.tex for a brief reference sheet.
     %-----------------------------------------------------------
    \@ifclassloaded{aguplus}{\PackageError{natbib}
      {The aguplus class already includes natbib coding,\MessageBreak
       so you should not add it explicitly}
      {Type <Return> for now, but then later remove\MessageBreak
       the command \protect\usepackage{natbib} from the document}
      \endinput}{}
    \@ifclassloaded{nlinproc}{\PackageError{natbib}
      {The nlinproc class already includes natbib coding,\MessageBreak
       so you should not add it explicitly}
      {Type <Return> for now, but then later remove\MessageBreak
       the command \protect\usepackage{natbib} from the document}
      \endinput}{}
    \@ifclassloaded{egs}{\PackageError{natbib}
      {The egs class already includes natbib coding,\MessageBreak
       so you should not add it explicitly}
      {Type <Return> for now, but then later remove\MessageBreak
       the command \protect\usepackage{natbib} from the document}
      \endinput}{}
     % Define citation punctuation for some author-year styles
     % One may add and delete at this point
     % Or put additions into local configuration file natbib.cfg
    \newcommand\bibstyle@chicago{\bibpunct{(}{)}{;}{a}{,}{,}}
    \newcommand\bibstyle@named{\bibpunct{[}{]}{;}{a}{,}{,}}
    \newcommand\bibstyle@agu{\bibpunct{[}{]}{;}{a}{,}{,~}}%Amer. Geophys. Union
    \newcommand\bibstyle@egs{\bibpunct{(}{)}{;}{a}{,}{,}}%Eur. Geophys. Soc.
    \newcommand\bibstyle@agsm{\bibpunct{(}{)}{,}{a}{}{,}\gdef\harvardand{\&}}
    \newcommand\bibstyle@kluwer{\bibpunct{(}{)}{,}{a}{}{,}\gdef\harvardand{\&}}
    \newcommand\bibstyle@dcu{\bibpunct{(}{)}{;}{a}{;}{,}\gdef\harvardand{and}}
    \newcommand\bibstyle@aa{\bibpunct{(}{)}{;}{a}{}{,}} %Astronomy & Astrophysics
    \newcommand\bibstyle@pass{\bibpunct{(}{)}{;}{a}{,}{,}}%Planet. & Space Sci
    \newcommand\bibstyle@anngeo{\bibpunct{(}{)}{;}{a}{,}{,}}%Annales Geophysicae
    \newcommand\bibstyle@nlinproc{\bibpunct{(}{)}{;}{a}{,}{,}}%Nonlin.Proc.Geophys.
     % Define citation punctuation for some numerical styles
    \newcommand\bibstyle@cospar{\bibpunct{/}{/}{,}{n}{}{}%
         \gdef\NAT@biblabelnum##1{##1.}}
    \newcommand\bibstyle@esa{\bibpunct{(Ref.~}{)}{,}{n}{}{}%
         \gdef\NAT@biblabelnum##1{##1.\hspace{1em}}}
    \newcommand\bibstyle@nature{\bibpunct{}{}{,}{s}{}{\textsuperscript{,}}%
         \gdef\NAT@biblabelnum##1{##1.}}
     % The standard LaTeX styles
    \newcommand\bibstyle@plain{\bibpunct{[}{]}{,}{n}{}{,}}
    \let\bibstyle@alpha=\bibstyle@plain
    \let\bibstyle@abbrv=\bibstyle@plain
    \let\bibstyle@unsrt=\bibstyle@plain
     % The author-year modifications of the standard styles
    \newcommand\bibstyle@plainnat{\bibpunct{[}{]}{,}{a}{,}{,}}
    \let\bibstyle@abbrvnat=\bibstyle@plainnat
    \let\bibstyle@unsrtnat=\bibstyle@plainnat
    \newif\ifNAT@numbers \NAT@numbersfalse
    \newif\ifNAT@super \NAT@superfalse
    \DeclareOption{numbers}{\NAT@numberstrue
       \ExecuteOptions{square,comma,nobibstyle}}
    \DeclareOption{super}{\NAT@supertrue\NAT@numberstrue
       \renewcommand\NAT@open{}\renewcommand\NAT@close{}
       \ExecuteOptions{nobibstyle}}
    \DeclareOption{authoryear}{\NAT@numbersfalse
       \ExecuteOptions{round,colon,bibstyle}}
    \DeclareOption{round}{%
          \renewcommand\NAT@open{(} \renewcommand\NAT@close{)}
       \ExecuteOptions{nobibstyle}}
    \DeclareOption{square}{%
          \renewcommand\NAT@open{[} \renewcommand\NAT@close{]}
       \ExecuteOptions{nobibstyle}}
    \DeclareOption{angle}{%
          \renewcommand\NAT@open{$<$} \renewcommand\NAT@close{$>$}
       \ExecuteOptions{nobibstyle}}
    \DeclareOption{curly}{%
          \renewcommand\NAT@open{\{} \renewcommand\NAT@close{\}}
       \ExecuteOptions{nobibstyle}}
    \DeclareOption{comma}{\renewcommand\NAT@sep{,}
       \ExecuteOptions{nobibstyle}}
    \DeclareOption{colon}{\renewcommand\NAT@sep{;}
       \ExecuteOptions{nobibstyle}}
    \DeclareOption{nobibstyle}{\let\bibstyle=\@gobble}
    \DeclareOption{bibstyle}{\let\bibstyle=\@citestyle}
    \newif\ifNAT@openbib \NAT@openbibfalse
    \DeclareOption{openbib}{\NAT@openbibtrue}
    \DeclareOption{sectionbib}{\def\NAT@sectionbib{on}}
    \def\NAT@sort{0}
    \DeclareOption{sort}{\def\NAT@sort{1}}
    \DeclareOption{sort&compress}{\def\NAT@sort{2}}
    \@ifpackageloaded{cite}{\PackageWarningNoLine{natbib}
      {The `cite' package should not be used\MessageBreak
       with natbib. Use option `sort' instead}\ExecuteOptions{sort}}{}
    \newif\ifNAT@longnames\NAT@longnamesfalse
    \DeclareOption{longnamesfirst}{\NAT@longnamestrue}
    \DeclareOption{nonamebreak}{\def\NAT@nmfmt#1{\mbox{\NAT@up#1}}}
    \def\NAT@nmfmt#1{{\NAT@up#1}}
    \renewcommand\bibstyle[1]{\@ifundefined{bibstyle@#1}{\relax}
         {\csname bibstyle@#1\endcsname}}
    \AtBeginDocument{\global\let\bibstyle=\@gobble}
    \let\@citestyle\bibstyle
    \newcommand\citestyle[1]{\@citestyle{#1}\let\bibstyle\@gobble}
    \@onlypreamble{\citestyle}\@onlypreamble{\@citestyle}
    \newcommand\bibpunct[7][, ]%
      {\gdef\NAT@open{#2}\gdef\NAT@close{#3}\gdef
       \NAT@sep{#4}\global\NAT@numbersfalse\ifx #5n\global\NAT@numberstrue
       \else
       \ifx #5s\global\NAT@numberstrue\global\NAT@supertrue
       \fi\fi
       \gdef\NAT@aysep{#6}\gdef\NAT@yrsep{#7}%
       \gdef\NAT@cmt{#1}%
       \global\let\bibstyle\@gobble
      }
    \@onlypreamble{\bibpunct}
    \newcommand\NAT@open{(} \newcommand\NAT@close{)}
    \newcommand\NAT@sep{;}
    \ProcessOptions
    \newcommand\NAT@aysep{,} \newcommand\NAT@yrsep{,}
    \newcommand\NAT@cmt{, }
    \newcommand\NAT@cite%
        [3]{\ifNAT@swa\NAT@@open\if*#2*\else#2\ \fi
            #1\if*#3*\else\NAT@cmt#3\fi\NAT@@close\else#1\fi\endgroup}
    \newcommand\NAT@citenum%
        [3]{\ifNAT@swa\NAT@@open\if*#2*\else#2\ \fi
            #1\if*#3*\else\NAT@cmt#3\fi\NAT@@close\else#1\fi\endgroup}
    \newcommand\NAT@citesuper[3]{\ifNAT@swa
    \unskip\kern\p@\textsuperscript{#1}%
       \if*#3*\else\ (#3)\fi\else #1\fi\endgroup}
    \providecommand
      \textsuperscript[1]{\mbox{$^{\mbox{\scriptsize#1}}$}}
    \providecommand\@firstofone[1]{#1}
    \newcommand\NAT@citexnum{}
    \def\NAT@citexnum[#1][#2]#3{%
     \NAT@sort@cites{#3}%
     \let\@citea\@empty
      \@cite{\def\NAT@num{-1}\let\NAT@last@yr\relax\let\NAT@nm\@empty
        \@for\@citeb:=\NAT@cite@list\do
        {\edef\@citeb{\expandafter\@firstofone\@citeb}%
         \if@filesw\immediate\write\@auxout{\string\citation{\@citeb}}\fi
         \@ifundefined{b@\@citeb\@extra@b@citeb}{%
           {\reset@font\bfseries?}
            \NAT@citeundefined\PackageWarning{natbib}%
           {Citation `\@citeb' on page \thepage \space undefined}}%
         {\let\NAT@last@num\NAT@num\let\NAT@last@nm\NAT@nm
          \NAT@parse{\@citeb}%
          \ifNAT@longnames\@ifundefined{bv@\@citeb\@extra@b@citeb}{%
            \let\NAT@name=\NAT@all@names
            \global\@namedef{bv@\@citeb\@extra@b@citeb}{}}{}%
          \fi
          \ifNAT@full\let\NAT@nm\NAT@all@names\else
            \let\NAT@nm\NAT@name\fi
          \ifNAT@swa
           \ifnum\NAT@ctype>1\relax\@citea
            \hyper@natlinkstart{\@citeb\@extra@b@citeb}%
                \ifnum\NAT@ctype=2\relax\NAT@test{\NAT@ctype}%
                \else\NAT@alias
                \fi\hyper@natlinkend\else
           \ifnum\NAT@sort>1
             \begingroup\catcode`\_=8
                \ifcat _\ifnum\z@<0\NAT@num _\else A\fi
                  \global\let\NAT@nm=\NAT@num \else \gdef\NAT@nm{-2}\fi
                \ifcat _\ifnum\z@<0\NAT@last@num _\else A\fi
                  \global\@tempcnta=\NAT@last@num \global\advance\@tempcnta by\@ne
                  \else \global\@tempcnta\m@ne\fi
             \endgroup
             \ifnum\NAT@nm=\@tempcnta
               \ifx\NAT@last@yr\relax
                 \edef\NAT@last@yr{\@citea \mbox{\noexpand\citenumfont{\NAT@num}}}%
               \else
                 \edef\NAT@last@yr{--\penalty\@m\mbox{\noexpand\citenumfont{\NAT@num}}}%
               \fi
             \else
               \NAT@last@yr \@citea \mbox{\citenumfont{\NAT@num}}%
               \let\NAT@last@yr\relax
             \fi
           \else
             \@citea \mbox{\hyper@natlinkstart{\@citeb\@extra@b@citeb}%
               {\citenumfont{\NAT@num}}\hyper@natlinkend}%
           \fi
           \fi
           \def\@citea{\NAT@sep\penalty\@m\NAT@space}%
          \else
            \ifcase\NAT@ctype\relax
              \ifx\NAT@last@nm\NAT@nm \NAT@yrsep\penalty\@m\NAT@space\else
              \@citea \NAT@test{1}\ \NAT@@open
              \if*#1*\else#1\ \fi\fi \NAT@mbox{%
              \hyper@natlinkstart{\@citeb\@extra@b@citeb}%
              {\citenumfont{\NAT@num}}\hyper@natlinkend}%
              \def\@citea{\NAT@@close\NAT@sep\penalty\@m\ }%
            \or\@citea
              \hyper@natlinkstart{\@citeb\@extra@b@citeb}%
               \NAT@test{\NAT@ctype}\hyper@natlinkend
              \def\@citea{\NAT@sep\penalty\@m\ }%
            \or\@citea
              \hyper@natlinkstart{\@citeb\@extra@b@citeb}%
               \NAT@test{\NAT@ctype}\hyper@natlinkend
              \def\@citea{\NAT@sep\penalty\@m\ }%
            \or\@citea
              \hyper@natlinkstart{\@citeb\@extra@b@citeb}%
               \NAT@alias\hyper@natlinkend
              \def\@citea{\NAT@sep\penalty\@m\ }%
            \fi
          \fi
          }}%
          \ifnum\NAT@sort>1\relax\NAT@last@yr\fi
          \ifNAT@swa\else\ifnum\NAT@ctype=0\if*#2*\else
          \NAT@cmt#2\fi \NAT@@close\fi\fi}{#1}{#2}}
    \newcommand\NAT@test[1]{\ifnum#1=1 \ifx\NAT@nm\NAT@noname
      {\reset@font\bfseries(author?)}\PackageWarning{natbib}
      {Author undefined for citation`\@citeb'
       \MessageBreak
       on page \thepage}\else \NAT@nm \fi
      \else \if\relax\NAT@date\relax
      {\reset@font\bfseries(year?)}\PackageWarning{natbib}
      {Year undefined for citation`\@citeb'
       \MessageBreak
       on page \thepage}\else \NAT@date \fi \fi}
    \let\citenumfont=\relax
    \newcommand\NAT@citex{}
    \def\NAT@citex%
      [#1][#2]#3{%
      \NAT@sort@cites{#3}%
      \let\@citea\@empty
      \@cite{\let\NAT@nm\@empty\let\NAT@year\@empty
        \@for\@citeb:=\NAT@cite@list\do
        {\edef\@citeb{\expandafter\@firstofone\@citeb}%
         \if@filesw\immediate\write\@auxout{\string\citation{\@citeb}}\fi
         \@ifundefined{b@\@citeb\@extra@b@citeb}{\@citea%
           {\reset@font\bfseries ?}\NAT@citeundefined
                     \PackageWarning{natbib}%
           {Citation `\@citeb' on page \thepage \space undefined}\def\NAT@date{}}%
         {\let\NAT@last@nm=\NAT@nm\let\NAT@last@yr=\NAT@year
         \NAT@parse{\@citeb}%
          \ifNAT@longnames\@ifundefined{bv@\@citeb\@extra@b@citeb}{%
            \let\NAT@name=\NAT@all@names
            \global\@namedef{bv@\@citeb\@extra@b@citeb}{}}{}%
          \fi
         \ifNAT@full\let\NAT@nm\NAT@all@names\else
           \let\NAT@nm\NAT@name\fi
         \ifNAT@swa\ifcase\NAT@ctype
           \if\relax\NAT@date\relax
             \@citea\hyper@natlinkstart{\@citeb\@extra@b@citeb}%
             \NAT@nmfmt{\NAT@nm}\NAT@date\hyper@natlinkend
           \else
             \ifx\NAT@last@nm\NAT@nm\NAT@yrsep
                \ifx\NAT@last@yr\NAT@year
                  \def\NAT@temp{{?}}%
                  \ifx\NAT@temp\NAT@exlab\PackageWarningNoLine{natbib}%
                   {Multiple citation on page \thepage: same authors and
                   year\MessageBreak without distinguishing extra
                   letter,\MessageBreak appears as question mark}\fi
                  \hyper@natlinkstart{\@citeb\@extra@b@citeb}\NAT@exlab
                  \hyper@natlinkend
                \else\unskip\
                  \hyper@natlinkstart{\@citeb\@extra@b@citeb}\NAT@date
                  \hyper@natlinkend
                \fi
             \else\@citea\hyper@natlinkstart{\@citeb\@extra@b@citeb}%
               \NAT@nmfmt{\NAT@nm}%
               \hyper@natlinkbreak{\NAT@aysep\ }{\@citeb\@extra@b@citeb}%
               \NAT@date\hyper@natlinkend
             \fi
           \fi
         \or\@citea\hyper@natlinkstart{\@citeb\@extra@b@citeb}%
             \NAT@nmfmt{\NAT@nm}\hyper@natlinkend
         \or\@citea\hyper@natlinkstart{\@citeb\@extra@b@citeb}%
             \NAT@date\hyper@natlinkend
         \or\@citea\hyper@natlinkstart{\@citeb\@extra@b@citeb}%
             \NAT@alias\hyper@natlinkend
         \fi \def\@citea{\NAT@sep\ }%
         \else\ifcase\NAT@ctype
            \if\relax\NAT@date\relax
              \@citea\hyper@natlinkstart{\@citeb\@extra@b@citeb}%
              \NAT@nmfmt{\NAT@nm}\hyper@natlinkend
            \else
             \ifx\NAT@last@nm\NAT@nm\NAT@yrsep
                \ifx\NAT@last@yr\NAT@year
                  \def\NAT@temp{{?}}%
                  \ifx\NAT@temp\NAT@exlab\PackageWarningNoLine{natbib}%
                   {Multiple citation on page \thepage: same authors and
                   year\MessageBreak without distinguishing extra
                   letter,\MessageBreak appears as question mark}\fi
                  \hyper@natlinkstart{\@citeb\@extra@b@citeb}\NAT@exlab
                  \hyper@natlinkend
                \else\unskip\
                  \hyper@natlinkstart{\@citeb\@extra@b@citeb}\NAT@date
                  \hyper@natlinkend
                \fi
             \else\@citea\hyper@natlinkstart{\@citeb\@extra@b@citeb}%
               \NAT@nmfmt{\NAT@nm}%
               \hyper@natlinkbreak{\ \NAT@@open\if*#1*\else#1\ \fi}%
                  {\@citeb\@extra@b@citeb}%
               \NAT@date\hyper@natlinkend\fi
            \fi
           \or\@citea\hyper@natlinkstart{\@citeb\@extra@b@citeb}%
             \NAT@nmfmt{\NAT@nm}\hyper@natlinkend
           \or\@citea\hyper@natlinkstart{\@citeb\@extra@b@citeb}%
             \NAT@date\hyper@natlinkend
           \or\@citea\hyper@natlinkstart{\@citeb\@extra@b@citeb}%
             \NAT@alias\hyper@natlinkend
           \fi \if\relax\NAT@date\relax\def\@citea{\NAT@sep\ }%
               \else\def\@citea{\NAT@@close\NAT@sep\ }\fi
         \fi
         }}\ifNAT@swa\else\if*#2*\else\NAT@cmt#2\fi
         \if\relax\NAT@date\relax\else\NAT@@close\fi\fi}{#1}{#2}}
    \newif\ifNAT@par \NAT@partrue
    \newcommand\NAT@@open{\ifNAT@par\NAT@open\fi}
    \newcommand\NAT@@close{\ifNAT@par\NAT@close\fi}
    \newcommand\NAT@alias{\@ifundefined{al@\@citeb\@extra@b@citeb}{%
      {\reset@font\bfseries(alias?)}\PackageWarning{natbib}
      {Alias undefined for citation `\@citeb'
      \MessageBreak on page \thepage}}{\@nameuse{al@\@citeb\@extra@b@citeb}}}
    \let\NAT@up\relax
    \newcommand\NAT@Up[1]{{\let\protect\@unexpandable@protect\let~\relax
      \expandafter\NAT@deftemp#1}\expandafter\NAT@UP\NAT@temp}
    \newcommand\NAT@deftemp[1]{\xdef\NAT@temp{#1}}
    \newcommand\NAT@UP[1]{\let\@tempa\NAT@UP\ifcat a#1\MakeUppercase{#1}%
      \let\@tempa\relax\else#1\fi\@tempa}
    \newcommand\shortcites[1]{%
      \@bsphack\@for\@citeb:=#1\do
      {\edef\@citeb{\expandafter\@firstofone\@citeb}%
       \global\@namedef{bv@\@citeb\@extra@b@citeb}{}}\@esphack}
    \newcommand\NAT@biblabel[1]{\hfill}
    \newcommand\NAT@biblabelnum[1]{\bibnumfmt{#1}}
    \newcommand\bibnumfmt[1]{[#1]}
    \def\@tempa#1{[#1]}
    \ifx\@tempa\@biblabel\let\@biblabel\@empty\fi
    \newcommand\NAT@bibsetnum[1]{\settowidth\labelwidth{\@biblabel{#1}}%
       \setlength{\leftmargin}{\labelwidth}\addtolength{\leftmargin}{\labelsep}%
       \setlength{\itemsep}{\bibsep}\setlength{\parsep}{\z@}%
       \ifNAT@openbib
         \addtolength{\leftmargin}{\bibindent}%
         \setlength{\itemindent}{-\bibindent}%
         \setlength{\listparindent}{\itemindent}%
         \setlength{\parsep}{0pt}%
       \fi
    }
    \newlength{\bibhang}
    \setlength{\bibhang}{1em}
    \newlength{\bibsep}
    {\@listi \global\bibsep\itemsep \global\advance\bibsep by\parsep}

    \newcommand\NAT@bibsetup%
       [1]{\setlength{\leftmargin}{\bibhang}\setlength{\itemindent}{-\leftmargin}%
           \setlength{\itemsep}{\bibsep}\setlength{\parsep}{\z@}}
    \newcommand\NAT@set@cites{\ifNAT@numbers
      \ifNAT@super \let\@cite\NAT@citesuper
         \def\NAT@mbox##1{\unskip\nobreak\hspace{1\p@}\textsuperscript{##1}}%
         \let\citeyearpar=\citeyear
         \let\NAT@space\relax\else
         \let\NAT@mbox=\mbox
         \let\@cite\NAT@citenum \def\NAT@space{ }\fi
      \let\@citex\NAT@citexnum
      \ifx\@biblabel\@empty\let\@biblabel\NAT@biblabelnum\fi
      \let\@bibsetup\NAT@bibsetnum
      \def\natexlab##1{}%
     \else
      \let\@cite\NAT@cite
      \let\@citex\NAT@citex
      \let\@biblabel\NAT@biblabel
      \let\@bibsetup\NAT@bibsetup
      \def\natexlab##1{##1}%
     \fi}
    \AtBeginDocument{\NAT@set@cites}
    \AtBeginDocument{\ifx\SK@def\@undefined\else
    \ifx\SK@cite\@empty\else
      \SK@def\@citex[#1][#2]#3{\SK@\SK@@ref{#3}\SK@@citex[#1][#2]{#3}}\fi
    \ifx\SK@citeauthor\@undefined\def\HAR@checkdef{}\else
      \let\citeauthor\SK@citeauthor
      \let\citefullauthor\SK@citefullauthor
      \let\citeyear\SK@citeyear\fi
    \fi}
    \AtBeginDocument{\@ifpackageloaded{hyperref}{%
      \ifnum\NAT@sort=2\def\NAT@sort{1}\fi}{}}
    \newif\ifNAT@full\NAT@fullfalse
    \newif\ifNAT@swa
    \DeclareRobustCommand\citet
       {\begingroup\NAT@swafalse\def\NAT@ctype{0}\NAT@partrue
         \@ifstar{\NAT@fulltrue\NAT@citetp}{\NAT@fullfalse\NAT@citetp}}
    \newcommand\NAT@citetp{\@ifnextchar[{\NAT@@citetp}{\NAT@@citetp[]}}
    \newcommand\NAT@@citetp{}
    \def\NAT@@citetp[#1]{\@ifnextchar[{\@citex[#1]}{\@citex[][#1]}}
    \DeclareRobustCommand\citep
       {\begingroup\NAT@swatrue\def\NAT@ctype{0}\NAT@partrue
             \@ifstar{\NAT@fulltrue\NAT@citetp}{\NAT@fullfalse\NAT@citetp}}
    \DeclareRobustCommand\cite
        {\begingroup\def\NAT@ctype{0}\NAT@partrue\NAT@swatrue
          \@ifstar{\NAT@fulltrue\NAT@cites}{\NAT@fullfalse\NAT@cites}}
    \newcommand\NAT@cites{\@ifnextchar [{\NAT@@citetp}{%
         \ifNAT@numbers\else
         \NAT@swafalse
         \fi
        \NAT@@citetp[]}}
    \DeclareRobustCommand\citealt
       {\begingroup\NAT@swafalse\def\NAT@ctype{0}\NAT@parfalse
             \@ifstar{\NAT@fulltrue\NAT@citetp}{\NAT@fullfalse\NAT@citetp}}
    \DeclareRobustCommand\citealp
       {\begingroup\NAT@swatrue\def\NAT@ctype{0}\NAT@parfalse
             \@ifstar{\NAT@fulltrue\NAT@citetp}{\NAT@fullfalse\NAT@citetp}}
    \DeclareRobustCommand\citeauthor
       {\begingroup\NAT@swafalse\def\NAT@ctype{1}\NAT@parfalse
        \@ifstar{\NAT@fulltrue\NAT@citetp}{\NAT@fullfalse\NAT@citetp}}
    \DeclareRobustCommand\Citet
       {\begingroup\NAT@swafalse\def\NAT@ctype{0}\NAT@partrue
         \let\NAT@up\NAT@Up
         \@ifstar{\NAT@fulltrue\NAT@citetp}{\NAT@fullfalse\NAT@citetp}}
    \DeclareRobustCommand\Citep
       {\begingroup\NAT@swatrue\def\NAT@ctype{0}\NAT@partrue
         \let\NAT@up\NAT@Up
             \@ifstar{\NAT@fulltrue\NAT@citetp}{\NAT@fullfalse\NAT@citetp}}
    \DeclareRobustCommand\Citealt
       {\begingroup\NAT@swafalse\def\NAT@ctype{0}\NAT@parfalse
         \let\NAT@up\NAT@Up
             \@ifstar{\NAT@fulltrue\NAT@citetp}{\NAT@fullfalse\NAT@citetp}}
    \DeclareRobustCommand\Citealp
       {\begingroup\NAT@swatrue\def\NAT@ctype{0}\NAT@parfalse
         \let\NAT@up\NAT@Up
             \@ifstar{\NAT@fulltrue\NAT@citetp}{\NAT@fullfalse\NAT@citetp}}
    \DeclareRobustCommand\Citeauthor
       {\begingroup\NAT@swafalse\def\NAT@ctype{1}\NAT@parfalse
         \let\NAT@up\NAT@Up
        \@ifstar{\NAT@fulltrue\NAT@citetp}{\NAT@fullfalse\NAT@citetp}}
    \DeclareRobustCommand\citeyear
       {\begingroup\NAT@swafalse\def\NAT@ctype{2}\NAT@parfalse\NAT@citetp}
    \DeclareRobustCommand\citeyearpar
       {\begingroup\NAT@swatrue\def\NAT@ctype{2}\NAT@partrue\NAT@citetp}
    \newcommand\citetext[1]{\NAT@open#1\NAT@close}
    \DeclareRobustCommand\citefullauthor
       {\citeauthor*}
    \newcommand\defcitealias[2]{%
       \@ifundefined{al@#1\@extra@b@citeb}{}
       {\PackageWarning{natbib}{Overwriting existing alias for citation #1}}
       \@namedef{al@#1\@extra@b@citeb}{#2}}
    \DeclareRobustCommand\citetalias{\begingroup
       \NAT@swafalse\def\NAT@ctype{3}\NAT@parfalse\NAT@citetp}
    \DeclareRobustCommand\citepalias{\begingroup
       \NAT@swatrue\def\NAT@ctype{3}\NAT@partrue\NAT@citetp}
    \renewcommand\nocite[1]{\@bsphack
      \@for\@citeb:=#1\do{%
        \edef\@citeb{\expandafter\@firstofone\@citeb}%
        \if@filesw\immediate\write\@auxout{\string\citation{\@citeb}}\fi
        \if*\@citeb\else
        \@ifundefined{b@\@citeb\@extra@b@citeb}{%
           \NAT@citeundefined \PackageWarning{natbib}%
           {Citation `\@citeb' undefined}}{}\fi}%
      \@esphack}
    \newcommand\NAT@parse[1]{{%
         \let\protect=\@unexpandable@protect\let~\relax
         \let\active@prefix=\@gobble
         \xdef\NAT@temp{\csname b@#1\@extra@b@citeb\endcsname}}%
         \expandafter\NAT@split\NAT@temp
         \expandafter\NAT@parse@date\NAT@date??????@@%
         \ifciteindex\NAT@index\fi
    }
    \newcommand\NAT@split[4]{%
      \gdef\NAT@num{#1}\gdef\NAT@name{#3}\gdef\NAT@date{#2}%
      \gdef\NAT@all@names{#4}%
      \ifx\NAT@noname\NAT@all@names \gdef\NAT@all@names{#3}\fi}
    \newcommand\NAT@parse@date{}
    \def\NAT@parse@date#1#2#3#4#5#6@@{%
      \ifnum\the\catcode`#1=11\def\NAT@year{}\def\NAT@exlab{#1}\else
      \ifnum\the\catcode`#2=11\def\NAT@year{#1}\def\NAT@exlab{#2}\else
      \ifnum\the\catcode`#3=11\def\NAT@year{#1#2}\def\NAT@exlab{#3}\else
      \ifnum\the\catcode`#4=11\def\NAT@year{#1#2#3}\def\NAT@exlab{#4}\else
        \def\NAT@year{#1#2#3#4}\def\NAT@exlab{{#5}}\fi\fi\fi\fi}
    \newcommand\NAT@index{}
    \let\NAT@makeindex=\makeindex
    \renewcommand\makeindex{\NAT@makeindex
      \renewcommand\NAT@index{\@bsphack\begingroup
         \def~{\string~}\@wrindex{\NAT@idxtxt}}}
    \newcommand\NAT@idxtxt{\NAT@name\ \NAT@open\NAT@date\NAT@close}
    \@ifundefined{@indexfile}{}{\let\NAT@makeindex\relax\makeindex}
    \newif\ifciteindex \citeindexfalse
    \newcommand\citeindextype{default}
    \newcommand\NAT@index@alt{{\let\protect=\noexpand\let~\relax
      \xdef\NAT@temp{\NAT@idxtxt}}\expandafter\NAT@exp\NAT@temp\@nil}
    \newcommand\NAT@exp{}
    \def\NAT@exp#1\@nil{\mbox{}\index[\citeindextype]{#1}}

    \AtBeginDocument{%
    \@ifpackageloaded{index}{\let\NAT@index=\NAT@index@alt}{}}
    \newcommand\NAT@ifcmd{\futurelet\NAT@temp\NAT@ifxcmd}
    \newcommand\NAT@ifxcmd{\ifx\NAT@temp\relax\else\expandafter\NAT@bare\fi}
    \def\NAT@bare#1(#2)#3(@)#4\@nil#5{%
      \if @#2
      \expandafter\NAT@apalk#1, , \@nil{#5}\else
      \stepcounter{NAT@ctr}%
      \NAT@wrout{\arabic {NAT@ctr}}{#2}{#1}{#3}{#5}
    \fi
    }
    \newcommand\NAT@wrout[5]{%
    \if@filesw
          {\let\protect\noexpand\let~\relax
           \immediate
           \write\@auxout{\string\bibcite{#5}{{#1}{#2}{{#3}}{{#4}}}}}\fi
    \ignorespaces}
    \def\NAT@noname{{}}
    \renewcommand\bibitem{%
      \@ifnextchar[{\@lbibitem}{%
        \global\NAT@stdbsttrue
        \stepcounter{NAT@ctr}\@lbibitem[\arabic{NAT@ctr}]}}
    \def\@lbibitem[#1]#2{%
      \if\relax\@extra@b@citeb\relax\else
        \@ifundefined{br@#2\@extra@b@citeb}{}{%
         \@namedef{br@#2}{\@nameuse{br@#2\@extra@b@citeb}}}\fi
       \@ifundefined{b@#2\@extra@b@citeb}{\def\NAT@num{}}{\NAT@parse{#2}}%
       \item[\hfil\hyper@natanchorstart{#2\@extra@b@citeb}\@biblabel{\NAT@num}%
        \hyper@natanchorend]%
        \NAT@ifcmd#1(@)(@)\@nil{#2}}
    \ifx\SK@lbibitem\@undefined\else
       \let\SK@lbibitem\@lbibitem
       \def\@lbibitem[#1]#2{%
         \SK@lbibitem[#1]{#2}\SK@\SK@@label{#2}\ignorespaces}\fi
    \newif\ifNAT@stdbst \NAT@stdbstfalse

    \AtEndDocument
      {\ifNAT@stdbst\if@filesw\immediate\write\@auxout{\string
       \global\string\NAT@numberstrue}\fi\fi
      }
    \providecommand\bibcite{}
    \renewcommand\bibcite[2]{\@ifundefined{b@#1\@extra@binfo}\relax
         {\NAT@citemultiple
          \PackageWarningNoLine{natbib}{Citation `#1' multiply defined}}%
      \global\@namedef{b@#1\@extra@binfo}{#2}}
    \AtEndDocument{\NAT@swatrue\let\bibcite\NAT@testdef}
    \newcommand\NAT@testdef[2]{%
      \def\NAT@temp{#2}\expandafter \ifx \csname b@#1\@extra@binfo\endcsname
        \NAT@temp \else \ifNAT@swa \NAT@swafalse
           \PackageWarningNoLine{natbib}{Citation(s) may have
              changed.\MessageBreak
              Rerun to get citations correct}\fi\fi}
    \newcommand\NAT@apalk{}
    \def\NAT@apalk#1, #2, #3\@nil#4{\if\relax#2\relax
      \global\NAT@stdbsttrue
      \NAT@wrout{#1}{}{}{}{#4}\else
      \stepcounter{NAT@ctr}%
      \NAT@wrout{\arabic {NAT@ctr}}{#2}{#1}{}{#4}\fi}
    \newcommand\citeauthoryear{}
    \def\citeauthoryear#1#2#3(@)(@)\@nil#4{\stepcounter{NAT@ctr}\if\relax#3\relax
       \NAT@wrout{\arabic {NAT@ctr}}{#2}{#1}{}{#4}\else
       \NAT@wrout{\arabic {NAT@ctr}}{#3}{#2}{#1}{#4}\fi}
    \newcommand\citestarts{\NAT@open}
    \newcommand\citeends{\NAT@close}
    \newcommand\betweenauthors{and}
    \newcommand\astroncite{}
    \def\astroncite#1#2(@)(@)\@nil#3{\stepcounter{NAT@ctr}\NAT@wrout{\arabic
    {NAT@ctr}}{#2}{#1}{}{#3}}
    \newcommand\citename{}
    \def\citename#1#2(@)(@)\@nil#3{\expandafter\NAT@apalk#1#2, \@nil{#3}}
    \newcommand\harvarditem[4][]%
        {\if\relax#1\relax\bibitem[#2(#3)]{#4}\else
            \bibitem[#1(#3)#2]{#4}\fi }
    \newcommand\harvardleft{\NAT@open}
    \newcommand\harvardright{\NAT@close}
    \newcommand\harvardyearleft{\NAT@open}
    \newcommand\harvardyearright{\NAT@close}
    \AtBeginDocument{\providecommand{\harvardand}{and}}
    \newcommand\harvardurl[1]{\textbf{URL:} \textit{#1}}
    \providecommand\bibsection{}
    \@ifundefined{chapter}%
      {\renewcommand\bibsection{\section*{\refname
        \@mkboth{\MakeUppercase{\refname}}{\MakeUppercase{\refname}}}}}
      {\@ifundefined{NAT@sectionbib}%
        {\renewcommand\bibsection{\chapter*{\bibname
         \@mkboth{\MakeUppercase{\bibname}}{\MakeUppercase{\bibname}}}}}
        {\renewcommand\bibsection{\section*{\bibname
         \ifx\@mkboth\@gobbletwo\else\markright{\MakeUppercase{\bibname}}\fi}}}}
    \@ifclassloaded{amsart}%
      {\renewcommand\bibsection{\section*{\refname}}}{}
    \@ifclassloaded{amsbook}%
      {\renewcommand\bibsection{\chapter*{\bibname}}}{}
    \@ifundefined{bib@heading}{}{\let\bibsection\bib@heading}
    \newcounter{NAT@ctr}
    \renewenvironment{thebibliography}[1]{%
     \bibsection\parindent \z@\bibpreamble\bibfont\list
       {\@biblabel{\arabic{NAT@ctr}}}{\@bibsetup{#1}%
        \setcounter{NAT@ctr}{0}}%
        \ifNAT@openbib
          \renewcommand\newblock{\par}
        \else
          \renewcommand\newblock{\hskip .11em \@plus.33em \@minus.07em}%
        \fi
        \sloppy\clubpenalty4000\widowpenalty4000
        \sfcode`\.=1000\relax
        \let\citeN\cite \let\shortcite\cite
        \let\citeasnoun\cite
     }{\def\@noitemerr{%
      \PackageWarning{natbib}
         {Empty `thebibliography' environment}}%
      \endlist\vskip-\lastskip}
    \let\bibfont\relax
    \let\bibpreamble\relax
    \providecommand\reset@font{\relax}
    \providecommand\bibname{Bibliography}
    \providecommand\refname{References}
    \newcommand\NAT@citeundefined{\gdef \NAT@undefined {%
        \PackageWarningNoLine{natbib}{There were undefined citations}}}
    \let \NAT@undefined \relax
    \newcommand\NAT@citemultiple{\gdef \NAT@multiple {%
        \PackageWarningNoLine{natbib}{There were multiply defined citations}}}
    \let \NAT@multiple \relax
    \AtEndDocument{\NAT@undefined\NAT@multiple}
    \providecommand\@mkboth[2]{}
    \providecommand\MakeUppercase{\uppercase}
    \providecommand{\@extra@b@citeb}{}
    \gdef\@extra@binfo{}
    \providecommand\hyper@natanchorstart[1]{}
    \providecommand\hyper@natanchorend{}
    \providecommand\hyper@natlinkstart[1]{}
    \providecommand\hyper@natlinkend{}
    \providecommand\hyper@natlinkbreak[2]{#1}
    \@ifundefined{bbl@redefine}{}{%
     \bbl@redefine\nocite#1{%
      \@safe@activestrue\org@nocite{#1}\@safe@activesfalse}%
    \bbl@redefine\@lbibitem[#1]#2{%
      \@safe@activestrue\org@@lbibitem[#1]{#2}\@safe@activesfalse}%
    }
    \AtBeginDocument{\@ifundefined{bbl@redefine}{}{%
    \bbl@redefine\@citex[#1][#2]#3{%
      \@safe@activestrue\org@@citex[#1][#2]{#3}\@safe@activesfalse}%
    \bbl@redefine\NAT@testdef#1#2{%
      \@safe@activestrue\org@NAT@testdef{#1}{#2}\@safe@activesfalse}%
    \@ifundefined{org@@lbibitem}{%
    \bbl@redefine\@lbibitem[#1]#2{%
      \@safe@activestrue\org@@lbibitem[#1]{#2}\@safe@activesfalse}}{}%
    }}
    \ifnum\NAT@sort>0
    \newcommand\NAT@sort@cites[1]{%
    \@tempcntb\m@ne
    \let\@celt\delimiter
    \def\NAT@num@list{}%
    \def\NAT@cite@list{}%
    \def\NAT@nonsort@list{}%
    \@for \@citeb:=#1\do{\NAT@make@cite@list}%
    \edef\NAT@cite@list{\NAT@cite@list\NAT@nonsort@list}%
    \edef\NAT@cite@list{\expandafter\NAT@xcom\NAT@cite@list @@}}
    \begingroup \catcode`\_=8
    \gdef\NAT@make@cite@list{%
         \edef\@citeb{\expandafter\@firstofone\@citeb}%
        \@ifundefined{b@\@citeb\@extra@b@citeb}{\def\NAT@num{A}}%
        {\NAT@parse{\@citeb}}%
          \ifcat _\ifnum\z@<0\NAT@num _\else A\fi
           \@tempcnta\NAT@num \relax
           \ifnum \@tempcnta>\@tempcntb
              \edef\NAT@num@list{\NAT@num@list \@celt{\NAT@num}}%
              \edef\NAT@cite@list{\NAT@cite@list\@citeb,}%
              \@tempcntb\@tempcnta
           \else
              \let\NAT@@cite@list=\NAT@cite@list \def\NAT@cite@list{}%
              \edef\NAT@num@list{\expandafter\NAT@num@celt \NAT@num@list \@gobble @}%
              {\let\@celt=\NAT@celt\NAT@num@list}%
           \fi
        \else
           \edef\NAT@nonsort@list{\NAT@nonsort@list\@citeb,}%
     \fi}
    \endgroup
    \def\NAT@celt#1{\ifnum #1<\@tempcnta
      \xdef\NAT@cite@list{\NAT@cite@list\expandafter\NAT@nextc\NAT@@cite@list @@}%
      \xdef\NAT@@cite@list{\expandafter\NAT@restc\NAT@@cite@list}%
     \else
      \xdef\NAT@cite@list{\NAT@cite@list\@citeb,\NAT@@cite@list}\let\@celt\@gobble%
     \fi}
    \def\NAT@num@celt#1#2{\ifx \@celt #1%
         \ifnum #2<\@tempcnta
            \@celt{#2}%
            \expandafter\expandafter\expandafter\NAT@num@celt
         \else
            \@celt{\number\@tempcnta}\@celt{#2}%
      \fi\fi}
    \def\NAT@nextc#1,#2@@{#1,}
    \def\NAT@restc#1,#2{#2}
    \def\NAT@xcom#1,@@{#1}
    \else
     \newcommand\NAT@sort@cites[1]{\edef\NAT@cite@list{#1}}\fi
    \InputIfFileExists{natbib.cfg}
           {\typeout{Local config file natbib.cfg used}}{}
    %%
    %% <<<<< End of generated file <<<<<<
    %%
    %% End of file `natbib.sty'.
  '';
}
