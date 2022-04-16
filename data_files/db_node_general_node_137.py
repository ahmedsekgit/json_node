==============================
 : Timeout - Async callback was not invoked within the 5000 ms timeout specified by jest.setTimeout.Timeout - Async callback was not invoked within the 5000 ms timeout specified by jest.setTimeout.Error:  
==============================
// add this in your test   beforeEach(() => {   jest.useFakeTimers()   jest.setTimeout(100000) })  afterEach(() => {   jest.clearAllTimers() })
// jest.config.js module.exports = {   // setupTestFrameworkScriptFile has been deprecated in   // favor of setupFilesAfterEnv in jest 24   setupFilesAfterEnv: ['./jest.setup.js'] }  // jest.setup.js jest.setTimeout(30000)
Timeout &ndash; Async callback was not invoked within the 5000 ms timeout specified by jest.setTimeout
  
==============================
137 at  2021-10-29T15:22:52.000Z
==============================
