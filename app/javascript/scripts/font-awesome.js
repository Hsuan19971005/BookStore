import {config, library, dom} from "@fortawesome/fontawesome-svg-core";
config.mutateApproach = "sync";
import {faGithub} from "@fortawesome/free-brands-svg-icons";
import {faThumbsUp as faThumbsUpRegular} from "@fortawesome/free-regular-svg-icons";
import {faThumbsUp as faThumbsUpSolid} from "@fortawesome/free-solid-svg-icons";

library.add(faGithub);
library.add(faThumbsUpRegular);
library.add(faThumbsUpSolid);

dom.watch();
