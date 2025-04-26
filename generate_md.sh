echo "" >> generated_functions.md
echo "## Address functions" >> generated_functions.md
echo "" >> generated_functions.md
jr man -c address -m >> generated_functions.md

echo "" >> generated_functions.md
echo "## Context functions" >> generated_functions.md
echo "" >> generated_functions.md
jr man -c context -m >> generated_functions.md

echo "" >> generated_functions.md
echo "## Date and Time functions" >> generated_functions.md
echo "" >> generated_functions.md
jr man -c time -m >> generated_functions.md

echo "" >> generated_functions.md
echo "## Finance functions" >> generated_functions.md
echo "" >> generated_functions.md
jr man -c finance -m >> generated_functions.md

echo "" >> generated_functions.md
echo "## Math functions" >> generated_functions.md
echo "" >> generated_functions.md
jr man -c math -m >> generated_functions.md

echo "" >> generated_functions.md
echo "## Network functions" >> generated_functions.md
echo "" >> generated_functions.md
jr man -c network -m >> generated_functions.md

echo "" >> generated_functions.md
echo "## People functions" >> generated_functions.md
echo "" >> generated_functions.md
jr man -c people -m >> generated_functions.md

echo "" >> generated_functions.md
echo "## Phone functions" >> generated_functions.md
echo "" >> generated_functions.md
jr man -c phone -m >> generated_functions.md

echo "" >> generated_functions.md
echo "## Text functions" >> generated_functions.md
echo "" >> generated_functions.md
jr man -c text -m >> generated_functions.md

echo "" >> generated_functions.md
echo "## Utilities functions" >> generated_functions.md
echo "" >> generated_functions.md
jr man -c utilities -m >> generated_functions.md
