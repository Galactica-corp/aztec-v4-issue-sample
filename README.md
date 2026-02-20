# Issue with `4.0.0-devnet.2-patch.0`

Steps to reproduce:
1. `aztec compile`
2. `aztec test`

Failing with 
```
[array_note] Testing test::test::test_issue_note ... FAIL
Failed calling external resolver. ErrorObject { code: ServerError(-32702), message: "Assertion failed: Index out of bounds", data: None }
```

After removing the array data field from the note and its `new` function the test passes.