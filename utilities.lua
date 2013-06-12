function pretty_print(arr)
  print("{")
  for ipair in ipairs(arr) do
    print("  " .. ipair .. " = " .. arr[ipair])
  end
  print("}")
end

