vim.api.nvim_create_user_command("CppTemplate", function(opts)
   local filename = opts.args ~= "" and opts.args or "main.cpp"

   local template = [[
#include <bits/stdc++.h>
using namespace std;

#define int long long
#define endl '\n'
#define all(x) x.begin(), x.end()

void solve() {

}

int32_t main() {
    ios::sync_with_stdio(0);
    cin.tie(0); cout.tie(0);

    int t = 1;
    // cin >> t;
    while(t--) solve();
    return 0;
}
]]

   vim.cmd("edit " .. filename)

   -- ✅ Make buffer modifiable
   -- vim.bo.modifiable = true

   -- Set lines
   vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(template, "\n"))

   -- Set filetype
   vim.bo.filetype = "cpp"
end, { nargs = "?" })
