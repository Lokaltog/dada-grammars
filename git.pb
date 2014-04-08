// git manual generator for the dada engine
// in response to http://www.reddit.com/r/programming/comments/22fpws/my_team_recently_switched_to_git_which_spawned/

#include <format.pbi>

// transformations:
pluralize:
    ".*[sc]h$" -> "$"/"es"
    ".*ex$" -> "ex$"/"ices"
    ".*y$" -> "y$"/"ies"
    ".*s$" -> "$"/"es"
    ".*" -> "$"/"s"
;
past-tensify:
    // exceptions
    "reset$" -> "$"/""
    "send" -> "send$"/"sent"
    "show" -> "show"/"shown"
    "checkout" -> "checkout$"/"checked out"

    ".*[aeiouy]t$" -> "$"/"ted"
    ".*[aeiouy]g$" -> "$"/"ged"
    ".*[aeiouy]p$" -> "$"/"ped"

    // general rules
    ".*e$" -> "$"/"d"
    ".*y$" -> "y$"/"ied"
    ".*" -> "$"/"ed"
;
present-participlify:
    // special cases
    ".*[aeiouy]t$" -> "$"/"ting"
    ".*[aeiouy]g$" -> "$"/"ging"
    ".*[aeiouy]p$" -> "$"/"ping"

    // general rules
    ".*e$" -> "e$"/"ing"
    ".*" -> "$"/"ing"
;
prepend-a-or-an:
    "^[aeiou].*$" -> "^"/"an "
    "^.*$"  -> "^"/"a "
;

// grammar:

output: PROLOGUE TITLE(name) BODY "DESCRIPTION" PBRK paragraph+;

name: command-name " - " action;

sentence: statement>upcase-first ". ";
paragraph: sentence sentence+ PBRK;

random-verb: verb | "abandon" | "abduct" | "abolish" | "abscond" | "abuse" | "accelerate" | "accomplish" | "accuse" | "accrue" | "achieve" | "achieve" | "acquire" | "act" | "activate" | "adapt" | "add" | "address" | "adjust" | "administer" | "advance" | "advise" | "advocate" | "affirm" | "aid" | "aim" | "alert" | "allocate" | "ze" | "answer" | "anticipate" | "apprehend" | "approach" | "appropriate" | "arbitrate" | "arrange" | "arrest" | "ascertain" | "assault" | "assemble" | "assess" | "assign" | "assist" | "assure" | "attack" | "attain" | "attract" | "audit" | "augment" | "authenticate" | "author" | "authorize" | "automate" | "avert" | "avoid" | "award" | "balance" | "bang" | "bank" | "bar" | "beat" | "berate" | "bill" | "bite" | "blast" | "blend" | "block" | "blow" | "bolster" | "book" | "boost" | "brace" | "brief" | "brighten" | "broke" | "buck" | "budget" | "built" | "bump" | "bury" | "bushwhack" | "calculate" | "call" | "calm" | "campaign" | "cancel" | "capitalize" | "catch" | "centralize" | "certify" | "chair" | "challenge" | "champion" | "change" | "channel" | "charge" | "chart" | "chase" | "check" | "choke" | "circumscribe" | "circumvent" | "clap" | "clarify" | "clash" | "classify" | "classify" | "climb" | "clip" | "clutch" | "coach" | "collaborate" | "collapse" | "collar" | "collate" | "collect" | "collide" | "combine" | "command" | "commandeer" | "communicate" | "compile" | "complete" | "compose" | "compute" | "compute" | "conceive" | "condense" | "conduct" | "confer" | "configure" | "conserve" | "consolidate" | "construct" | "consult" | "contract" | "control" | "convert" | "coordinate" | "correlate" | "counsel" | "count" | "cram" | "crash" | "crawl" | "create" | "creep" | "cripple" | "critique" | "crouch" | "cultivate" | "cure" | "customize" | "cut" | "dance" | "dart" | "dash" | "deal" | "debate" | "decide" | "deck" | "decorate" | "decrease" | "deduct" | "define" | "delegate" | "delete" | "deliberate" | "delineate" | "deliver" | "demonstrate" | "derive" | "descend" | "describe" | "design" | "detail" | "detect" | "determine" | "develop" | "devise" | "devise" | "diagnose" | "dictate" | "dig" | "direct" | "discard" | "discover" | "dispatch" | "display" | "dissect" | "distinguish" | "distribute" | "distribute" | "ditch" | "dive" | "divert" | "do" | "dodge" | "dominate" | "dope" | "double" | "douse" | "draft" | "drag" | "drain" | "dramatize" | "drape" | "draw" | "dress" | "drill" | "drink" | "drip" | "drop" | "drown" | "drug" | "dry" | "duel" | "dunk" | "earn" | "ease" | "edge" | "edit" | "edit" | "educate" | "effect" | "eject" | "elect" | "elevate" | "eliminate" | "elope" | "elude" | "emerge" | "employ" | "enable" | "enact" | "encourage" | "endure" | "engage" | "engineer" | "enjoin" | "ensnare" | "ensure" | "enter" | "equip" | "erupt" | "escalate" | "escape" | "establish" | "establish" | "estimate" | "evacuate" | "evade" | "evaluate" | "evict" | "examine" | "execute" | "exert" | "exhale" | "exhibit" | "exit" | "expand" | "expand" | "expedite" | "expel" | "explode" | "experience" | "experiment" | "explain" | "explore" | "expose" | "extend" | "extirpate" | "extract" | "extricate" | "facilitate" | "fade" | "fake" | "fall" | "falter" | "fan" | "fashion" | "fast" | "fear" | "feed" | "feel" | "fend" | "field" | "fight" | "file" | "fill" | "finance" | "find" | "finger" | "finish" | "fix" | "flag" | "flap" | "flash" | "flatten" | "flaunt" | "flay" | "flee" | "flick" | "flinch" | "fling" | "flip" | "flit" | "float" | "flog" | "flounder" | "flout" | "flush" | "focus" | "fondle" | "force" | "forecast" | "forge" | "formalize" | "form" | "formulate" | "fornicate" | "foster" | "found" | "fumble" | "fund" | "furnish" | "gain" | "gallop" | "gather" | "generate" | "gesture" | "get" | "give" | "gnaw" | "gossip" | "gouge" | "govern" | "graduate" | "grab" | "grapple" | "grasp" | "greet" | "grind" | "grip" | "grope" | "ground" | "grow" | "growl" | "grunt" | "guard" | "guide" | "gyrate" | "hack" | "hail" | "halt" | "halve" | "hammer" | "handle" | "hang" | "harass" | "hasten" | "haul" | "head" | "help" | "hesitate" | "hide" | "hijack" | "hire" | "hit" | "hitch" | "hobble" | "hoist" | "hold" | "hover" | "hug" | "hurl" | "hurtle" | "hypothesize" | "identify" | "ignore" | "illustrate" | "imitate" | "implement" | "improve" | "improvise" | "inch" | "increase" | "increase" | "index" | "indict" | "individualize" | "induce" | "inflict" | "influence" | "inform" | "initiate" | "inject" | "injure" | "innovate" | "insert" | "inspect" | "inspire" | "install" | "instigate" | "institute" | "instruct" | "integrate" | "intensify" | "interchange" | "interpret" | "interview" | "introduce" | "invade" | "invent" | "inventory" | "invest" | "investigate" | "isolate" | "itemize" | "jab" | "jam" | "jar" | "jeer" | "jerk" | "jimmy" | "jingle" | "jolt" | "judge" | "jump" | "justify" | "keel" | "keynote" | "kibitz" | "kick" | "kidnap" | "kill" | "kneel" | "knife" | "land" | "lash" | "launch" | "lead" | "lean" | "leap" | "learn" | "lecture" | "led" | "left" | "lessen" | "level" | "license" | "lick" | "limp" | "link" | "listen" | "locate" | "log" | "lower" | "lunge" | "lurch" | "make" | "maim" | "maintain" | "make" | "manage" | "mangle" | "manipulate" | "manufacture" | "march" | "mark" | "market" | "massage" | "master" | "maul" | "measure" | "meddle" | "mediate" | "meet" | "mend" | "mentor" | "mimic" | "mingle" | "minimize" | "mobilize" | "mock" | "model" | "mold" | "molest" | "monitor" | "motivate" | "mourn" | "move" | "mumble" | "murder" | "muster" | "mutilate" | "nab" | "nag" | "nail" | "narrow" | "needle" | "negotiate" | "nick" | "nip" | "nominate" | "nurture" | "observe" | "obtain" | "occupy" | "offer" | "officiate" | "operate" | "order" | "organize" | "originate" | "outline" | "overcome" | "oversee" | "pack" | "participate" | "paddle" | "page" | "pander" | "panic" | "parachute" | "parade" | "ze" | "park" | "parry" | "party" | "pass" | "pat" | "patrol" | "pause" | "paw" | "peel" | "peep" | "penetrate" | "perceive" | "perfect" | "perform" | "persuade" | "photograph" | "pick" | "picket" | "pile" | "pilot" | "pin" | "pinch" | "pioneer" | "pirate" | "pitch" | "placate" | "place" | "plan" | "play" | "plod" | "plow" | "plunge" | "pocket" | "poke" | "polish" | "pore" | "pose" | "position" | "pounce" | "pout" | "pray" | "predict" | "preen" | "prepare" | "prescribe" | "present" | "preside" | "preside" | "primp" | "print" | "prioritize" | "probe" | "process" | "procure" | "prod" | "produce" | "profitable" | "program" | "project" | "promote" | "prompt" | "proofread" | "propel" | "propose" | "protect" | "prove" | "provide" | "provoke" | "pry" | "publicize" | "publish" | "pull" | "pummel" | "pump" | "punch" | "purchase" | "purge" | "pursue" | "push" | "qualify" | "question" | "quicken" | "quit" | "quiz" | "race" | "raid" | "raise" | "ram" | "ransack" | "rape" | "rate" | "rattle" | "ravage" | "rave" | "read" | "realize" | "rebuild" | "receive" | "recline" | "recommend" | "reconcile" | "reconnoiter" | "record" | "recoup" | "recruit" | "redeem" | "reduce" | "reel" | "refer" | "regain" | "regulate" | "reinforce" | "rejoin" | "relate" | "relate" | "relax" | "relent" | "relieve" | "remove" | "render" | "renew" | "renovate" | "reorganize" | "repair" | "repel" | "report" | "represent" | "repulse" | "research" | "resign" | "resist" | "resolve" | "respond" | "restore" | "retain" | "retaliate" | "retreat" | "retrieve" | "reveal" | "review" | "revise" | "ride" | "rip" | "rise" | "risk" | "rob" | "rock" | "roll" | "rub" | "run" | "rush" | "sail" | "salute" | "sap" | "satisfy" | "save" | "saw" | "scale" | "scamper" | "scan" | "scare" | "scatter" | "scavenge" | "schedule" | "scold" | "scoop" | "scoot" | "score" | "scour" | "scout" | "scrape" | "scrawl" | "scream" | "screen" | "screw" | "scrub" | "scruff" | "scuffle" | "sculpt" | "scuttle" | "seal" | "search" | "secure" | "seduce" | "segment" | "seize" | "select" | "sell" | "sense" | "serve" | "service" | "set" | "set up" | "sever" | "sew" | "shake" | "shanghai" | "shape" | "share" | "sharpen" | "shave" | "shear" | "shell" | "shield" | "shift" | "shiver" | "shock" | "shoot" | "shorten" | "shout" | "shove" | "shovel" | "show" | "shun" | "shut" | "sidestep" | "sigh" | "signal" | "simplify" | "sip" | "sit" | "size" | "skid" | "skim" | "skip" | "skirt" | "slacken" | "slam" | "slap" | "slash" | "slay" | "slide" | "slug" | "smack" | "smear" | "smell" | "smuggle" | "snap" | "snare" | "snarl" | "snatch" | "snicker" | "sniff" | "snitch" | "snoop" | "snub" | "snuff" | "snuggle" | "soak" | "sock" | "soil" | "Sold" | "solve" | "sort" | "spark" | "spear" | "spell" | "spike" | "spin" | "splatter" | "splice" | "split" | "spot" | "spray" | "spread" | "spring" | "sprint" | "spurn" | "spy" | "squeak" | "stack" | "staff" | "stagger" | "stamp" | "stand" | "start" | "startle" | "steal" | "steer" | "step" | "stick" | "stiffen" | "stifle" | "stimulate" | "stock" | "stomp" | "stop" | "strangle" | "strap" | "strategize" | "streamline" | "strengthen" | "stress" | "strike" | "strip" | "stroke" | "struck" | "structure" | "stub" | "study" | "stuff" | "stumble" | "stun" | "subdue" | "submerge" | "submit" | "submit" | "succeed" | "suck" | "summarize" | "sum" | "summon" | "supervise" | "support" | "surrender" | "survey" | "suspend" | "sustain" | "swagger" | "swallow" | "swap" | "sway" | "swear" | "swerve" | "swim" | "swing" | "swipe" | "switch" | "synergize" | "synthesize" | "systematize" | "tabulate" | "tackle" | "take" | "tap" | "target" | "taste" | "taunt" | "teach" | "tear" | "tease" | "telephone" | "terrorize" | "test" | "thin" | "thrash" | "thread" | "threaten" | "throw" | "tickle" | "tie" | "tighten" | "tilt" | "tip" | "toss" | "touch" | "tout" | "track" | "train" | "transcribe" | "transfer" | "transfer" | "transform" | "translate" | "transport" | "trap" | "tread" | "treat" | "trim" | "trip" | "triple" | "trot" | "trounce" | "try" | "tuck" | "tug" | "tumble" | "turn" | "tutor" | "twist" | "type" | "uncover" | "understand" | "undertake" | "undo" | "undress" | "unfold" | "unify" | "unify" | "unite" | "unravel" | "untangle" | "unwind" | "update" | "usher" | "utilize" | "utilize" | "vacate" | "validate" | "value" | "vanish" | "vanquish" | "vault" | "vent" | "verbalize" | "verify" | "violate" | "wade" | "walk" | "wander" | "ward" | "watch" | "wave" | "wedge" | "weed" | "weigh" | "whack" | "whip" | "whirl" | "whistle" | "widen" | "wield" | "wiggle" | "win" | "withdraw" | "withdraw" | "work" | "wreck" | "wrench" | "wrestle" | "write" | "wrought" | "yank" | "yell" | "yelp" | "yield" | "zap" | "zip";

verb:
    "add" |
    "annotate" |
    "apply" |
    "archive" |
    "bisect" |
    "blame" |
    "branch" |
    "bundle" |
    "check" |
    "checkout" |
    "cherry-pick" |
    "clean" |
    "clone" |
    "commit" |
    "configure" |
    "count" |
    "describe" |
    "diff" |
    "export" |
    "fast-export" |
    "fast-import" |
    "fetch" |
    "filter-branch" |
    "format-patch" |
    "forward-port" |
    "fsck" |
    "grep" |
    "help" |
    "import" |
    "index" |
    "init" |
    "log" |
    "merge" |
    "name" |
    "note" |
    "pack" |
    "parse" |
    "patch" |
    "prune" |
    "pull" |
    "push" |
    "quiltimport" |
    "reapply" |
    "rebase" |
    "reflog" |
    "relink" |
    "remote" |
    "remove" |
    "repack" |
    "request" |
    "reset" |
    "rev-list" |
    "rev-parse" |
    "revert" |
    "send" |
    "show" |
    "stage" |
    "stash" |
    "strip" |

    // extras:
    "specify" |
    "perform" |
    "save" |
    "fail" |
    "succeed" |
    "prevent" |
    "return"
;

location:
    ["non-" [verb>present-participlify " " | ""] | ""]
    [
        "local" |
        "remote" |
        "upstream" |
        "downstream" |
        "staged" |
        "unstaged" |
        "applied"
    ];

item:
    "archive" |
    "area" |
    "base" |
    "branch" |
    "change" |
    "commit" |
    "file" |
    "head" |
    "history" |
    "index" |
    "log" |
    "object" |
    "pack" |
    "ref" |
    "stage" |
    "stash" |
    "submodule" |
    "subtree" |
    "tag" |
    "tip" |
    "tree"
;

preposition:
    "before" |
    "below" |
    "for" |
    "from" |
    "inside" |
    "next to" |
    "opposite of" |
    "outside" |
    "over" |
    "to"
;

determiner:
    "a few" |
    "all" |
    "any" |
    "some" |
    "the" |
    "various"
;

adjective:
    "automatic" |
    "passive" |
    "temporary" |
    "original"
;

command-name: "git-" random-verb "-" [verb "-" | ""] [random-verb | item];
action: verb " " [located-item>prepend-a-or-an | determiner " " located-item>pluralize] " " preposition " " random-verb>past-tensify " " located-item>pluralize;

condition-conjunction: "if" | "when" | "in case";
condition:
    tagged-item " is " ["not" | ""] " " verb>past-tensify
;

multiple-items: determiner " " adjective " " item>pluralize;

// make sure we're not consistent:
failure: "failure" | "error" | "breakdown" | "segfault" | "collapse";
sometimes: "sometimes" | "in some cases" | "rarely";
possible: "possible" | "a possibility" | "a small chance";
supplied: "supplied" | "specified" | "set" | "defined";
located-item: [location " " | ""] item;
tagged-item: "<" [ ["new" | "old"] item | verb "-" item ] ">" | verb>upcase "_" item>upcase;
command-option: "--" [random-verb | random-verb "-" item | random-verb "-" verb "-" item];
subject: "you" | "the user" | "the " command-name " command";
will: "will have to" | "may have to" | "should";

statement:
    condition-conjunction " " condition ", " command-name " " command-option " will perform " adjective>prepend-a-or-an " " command-name [" before doing anything else" | ""] |

    multiple-items " " verb>past-tensify " by " item>pluralize " in the " located-item " but that " [sometimes " " | ""] " are not in " tagged-item " are " verb>past-tensify " in " adjective>prepend-a-or-an " " item |

    multiple-items " are " verb>past-tensify " to " tagged-item ", or " tagged-item " if the " command-option " option was " supplied |

    "the same set of " item>pluralize " would " [sometimes " " | ""] " be " verb>past-tensify " by " command-name " " command-option [" (or " command-name ", if " command-option " was " supplied ")" | ""] |

    tagged-item " is " verb>past-tensify " to " verb " the " item " of the " item " " preposition " the " verb |

    multiple-items " that were previously " verb>past-tensify " " preposition " the " adjective " " item " are " verb>past-tensify " to " adjective>prepend-a-or-an " " item |

    "it is " [sometimes " " | ""] " " possible " that " verb>past-tensify>prepend-a-or-an " " failure " will prevent " adjective " " verb>present-participlify " of " multiple-items |

    subject " " will " " verb " any such " verb " " failure>pluralize " and run " command-name " " command-option " instead" |

    "to " verb " " adjective>prepend-a-or-an " " tagged-item " and " verb " the working " item>pluralize ", use the command " command-name " " command-option " instead"
;
