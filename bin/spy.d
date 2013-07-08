#!/usr/sbin/dtrace -s

/* Run like:
% sudo csh
# ./spy.d $PROCESS_ID [$INTERESTING_PROBEPROV]

Prints a line of dashes every 5 seconds to delineate different experiments.
*/

#pragma D option quiet
/* don't gripe if $2 (interesting dude) is missing */
#pragma D option defaultargs

BEGIN
{
    /* "Interesting" probemods/funcs cause a stack trace to be dumped when they float by */

    interesting["-viewDidLoad"] = 1;

/* Some other examples:
    interesting["UITouch"] = 1;
    interesting["UITouch(UITouchInternal)"] = 1;
*/
}

BEGIN
{
    /* There is a _lot_ of noise in a typical program.  This is a start on a filter of that stuff.
     * Add something to ignores to stop any logging about that symbol. */
    ignores["+alloc"] = 1;
    ignores["+allocWithZone:"] = 1;
    ignores["+array"] = 1;
    ignores["+arrayWithObject:"] = 1;
    ignores["+itemType:canBeEnabledForData:style:"] = 1;
    ignores["+self"] = 1;
    ignores["-_copyRenderLayer:layerFlags:commitFlags:"] = 1;
    ignores["-_didCommitLayer:"] = 1;
    ignores["-addObject:"] = 1;
    ignores["-autorelease"] = 1;
    ignores["-bounds"] = 1;
    ignores["-class"] = 1;
    ignores["-contents"] = 1;
    ignores["-copy"] = 1;
    ignores["-copyWithZone:"] = 1;
    ignores["-count"] = 1;
    ignores["-countByEnumeratingWithState:objects:count:"] = 1;
    ignores["-dealloc"] = 1;
    ignores["-frame"] = 1;
    ignores["-hash"] = 1;
    ignores["-init"] = 1;
    ignores["-insertObject:atIndex:"] = 1;
    ignores["-isKindOfClass"] = 1;
    ignores["-layer"] = 1;
    ignores["-length"] = 1;
    ignores["-modelLayer"] = 1;
    ignores["-objectAtIndex:"] = 1;
    ignores["-opacity"] = 1;
    ignores["-rawData"] = 1;
    ignores["-release"] = 1;
    ignores["-replaceObjectAtIndex:withObject:"] = 1;
    ignores["-respondsToSelector:"] = 1;
    ignores["-retain"] = 1;
    ignores["-setItem:enabled:"] = 1;
    ignores["-superlayer"] = 1;
    printf ("Ignoring lots of common stuff\n");
}

objc$1:::entry
/ignores[probefunc] != 1/
{
    printf ("%s %s\n", probemod, probefunc);
}


objc$1:::entry
/probemod == $$2 || probefunc == $$2 || interesting[probemod] == 1 || interesting[probefunc] == 1/
{
    printf ("\nINTERESTING %s %s\n", probemod, probefunc);
    ustack();
}

profile:::tick-5s
{
    printf ("--------------------------------------------------\n");
}
