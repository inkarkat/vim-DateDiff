DATE DIFF
===============================================================================
_by Ingo Karkat_

DESCRIPTION
------------------------------------------------------------------------------

Dates are everywhere. As timestamps in logfiles, in the prompts of a captured
shell session, or in the email reply from Fred where he tells you he's on
vacation from Oct 25, 2019 to Nov 11, 2019. Often, you're interested in how
much time lies between two dates; calculating that is tedious, pasting the
dates into another application has the added complication that the used format
must be understood. How great would it be if Vim could automatically parse
various common date formats and tell you the difference?!

This plugin provides :DateDiff and :TimeDiff commands that parse dates /
times, either from provided argument(s), a passed {range}, or a combination.
The difference of those two points in time is then printed in time units that
fit the range (or are passed, if the :...Unit variants are used):

    :DateDiff from Oct 25, 2019 to Nov 11, 2019
    409 hours = 17 days = 2.4 weeks = 0.6 months

### HOW IT WORKS

The recognized date and time patterns are configured as part of the plugin,
and this allows some massaging to recognize non-standard formats.
Unfortunately, Vim does not have a built-in function to parse dates into the
epoch, so an external "date" tool is required.

### SOURCE
(Original Vim tip, Stack Overflow answer, ...)

### SEE ALSO
(Plugins offering complementary functionality, or plugins using this library.)

### RELATED WORKS
(Alternatives from other authors, other approaches, references not used here.)

USAGE
------------------------------------------------------------------------------

    :DateDiff {date} [{date2}]
    :DateDiff [{text}]{date}{text}[{date2}][{text}]
                            Calculate the difference between {date} and {date2} /
                            now, and print it in flexible units depending on the
                            magnitude of the difference.
    :{range}DateDiff        Parse the first and last line in {range} for dates /
                            timestamps, calculate the difference between them, and
                            print it.
    :{lnum}DateDiff [{date}]
    :{lnum}DateDiff [[{text}]{date}[{text}]]
                            Parse {lnum} for a date / timestamp, calculate the
                            difference to {date} / now, and print it.

    :[...]DateDiffUnit {unit} [...]
                            Like above, but print the date difference only in the
                            passed {unit}, which can be one of:
                            *, all      all suitable units (i.e. like :DateDiff)
                            <, smallest the smallest unit (that has non-zero value)
                            >, largest  the largest unit (that has non-zero value)
                            =, best     the best unit (largest that is not just a
                                        fraction)
                            ms, millis  the corresponding unit
                            s, seconds
                            min, minutes Note that the abbreviation is min, not m!
                            h, hours
                            d, days
                            w, weeks
                            m, months
                            y, years
                            g, generations

    :[...]TimeDiff [...]
    :[...]TimeDiffUnit {unit} [...]
                            Calculate the difference between {time} and {time2} /
                            the current time, and print it ...
                            Exactly like :DateDiff, but only parses times (e.g.
                            09:59 or 112231,456).

INSTALLATION
------------------------------------------------------------------------------

The code is hosted in a Git repo at https://github.com/inkarkat/vim-DateDiff
You can use your favorite plugin manager, or "git clone" into a directory used
for Vim packages. Releases are on the "stable" branch, the latest unstable
development snapshot on "master".

This script is also packaged as a vimball. If you have the "gunzip"
decompressor in your PATH, simply edit the \*.vmb.gz package in Vim; otherwise,
decompress the archive first, e.g. using WinZip. Inside Vim, install by
sourcing the vimball or via the :UseVimball command.

    vim DateDiff*.vmb.gz
    :so %

To uninstall, use the :RmVimball command.

### DEPENDENCIES

- Requires Vim 7.0 or higher.
- Requires the ingo-library.vim plugin ([vimscript #4433](http://www.vim.org/scripts/script.php?script_id=4433)), version 1.039 or
  higher.

CONFIGURATION
------------------------------------------------------------------------------

For a permanent configuration, put the following commands into your vimrc:

The recognized date / time patterns are configured in a List of pairs; the
first is the regular expression to match the date / time, the second a
replacement that allows to reshuffle or convert the date into a format that is
understood by the system's date command (which is used to convert the date
into the count of seconds after the epoch; i.e. since 01-Jan-1970). A good
format is YYYY-mm-dd HH:MM:SS. If you have higher-precision times, you can
append microseconds as ,µµµ. If no conversion is necessary, the replacement
'&amp;' uses the match as-is.

    let g:DateDiff_DatePatterns = [[{pattern}, {replacement}], ...]

In order to convert month names into numbers (January = 1, ...), two Lists of
months are used. These can be modified to match localized month names.

CONTRIBUTING
------------------------------------------------------------------------------

Report any bugs, send patches, or suggest features via the issue tracker at
https://github.com/inkarkat/vim-DateDiff/issues or email (address below).

HISTORY
------------------------------------------------------------------------------

##### GOAL
First published version.

##### 0.10    25-Oct-2019
- (Finally) finished initial implementation.

##### 0.01    03-Oct-2018
- Started development.

------------------------------------------------------------------------------
Copyright: (C) 2018-2019 Ingo Karkat -
The [VIM LICENSE](http://vimdoc.sourceforge.net/htmldoc/uganda.html#license) applies to this plugin.

Maintainer:     Ingo Karkat &lt;ingo@karkat.de&gt;
