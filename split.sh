#!/bin/bash
pod_name='B'
base_repo_path=$(pwd)
pod_from_path=''${pod_name}
pod_to_path='../'${pod_name}
branch_name='pod_for_'${pod_name}'_'${RANDOM}
git subtree split -P ${pod_from_path} -b ${branch_name}
mkdir ../${pod_name}
cd ../${pod_name}
git init
git pull ${base_repo_path} ${branch_name}
cd ${base_repo_path}
git branch -D ${branch_name}
cd ../${pod_name}
echo '拆分出的「'${pod_name}'」库路径为: '$(pwd)', 请手动 push 到对应的远端仓库，同时删除主项目对应的文件夹，最后升级主端当前库的引入方式。'
open .
