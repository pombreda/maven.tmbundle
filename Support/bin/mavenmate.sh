#!/usr/bin/env bash
source "$TM_SUPPORT_PATH/lib/bash_init.sh"

export RUBYLIB="$TM_BUNDLE_SUPPORT/lib:$RUBYLIB"
TM_MVN="${TM_MVN:-mvn}"

require_cmd "$TM_MVN" "If you have installed maven, then you need to either <a href=\"help:anchor='search_path'%20bookID='TextMate%20Help'\">update your <tt>PATH</tt></a> or set the <tt>TM_MVN</tt> shell variable (e.g. in Preferences / Advanced)"

export TM_MVN=`which "$TM_MVN"`

if [ "$TM_PROJECT_DIRECTORY" ]
then
    export MVN_PROJECT="$TM_PROJECT_DIRECTORY"
elif [ "$TM_DIRECTORY" ]
then
    export MVN_PROJECT="$TM_DIRECTORY"
else
    exit_show_tool_tip 'Neither $TM_PROJECT_DIRECTORY nor $TM_DIRECTORY are set'
fi


/System/Library/Frameworks/Ruby.framework/Versions/1.8/usr/bin/ruby  -- "$TM_BUNDLE_SUPPORT/lib/MavenMate.rb" -m "$TM_MVN" -l "$MVN_PROJECT" $@

rescan_project
