local loaded, dapgo = pcall(require, "dap-go")
if not loaded then
	return
end
dapgo.setup()
