/* -*- Mode: c++; c-basic-offset: 4; indent-tabs-mode: nil; tab-width: 40 -*- */
/* ***** BEGIN LICENSE BLOCK *****
 * Version: MPL 1.1/GPL 2.0/LGPL 2.1
 *
 * The contents of this file are subject to the Mozilla Public License Version
 * 1.1 (the "License"); you may not use this file except in compliance with
 * the License. You may obtain a copy of the License at
 * http://www.mozilla.org/MPL/
 *
 * Software distributed under the License is distributed on an "AS IS" basis,
 * WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
 * for the specific language governing rights and limitations under the
 * License.
 *
 * The Original Code is worker threads.
 *
 * The Initial Developer of the Original Code is
 *   Mozilla Corporation.
 * Portions created by the Initial Developer are Copyright (C) 2008
 * the Initial Developer. All Rights Reserved.
 *
 * Contributor(s):
 *   Vladimir Vukicevic <vladimir@pobox.com> (Original Author)
 *   Ben Turner <bent.mozilla@gmail.com>
 *
 * Alternatively, the contents of this file may be used under the terms of
 * either the GNU General Public License Version 2 or later (the "GPL"), or
 * the GNU Lesser General Public License Version 2.1 or later (the "LGPL"),
 * in which case the provisions of the GPL or the LGPL are applicable instead
 * of those above. If you wish to allow use of your version of this file only
 * under the terms of either the GPL or the LGPL, and not to allow others to
 * use your version of this file under the terms of the MPL, indicate your
 * decision by deleting the provisions above and replace them with the notice
 * and other provisions required by the GPL or the LGPL. If you do not delete
 * the provisions above, a recipient may use your version of this file under
 * the terms of any one of the MPL, the GPL or the LGPL.
 *
 * ***** END LICENSE BLOCK ***** */

#ifndef __NSDOMWORKERPOOL_H__
#define __NSDOMWORKERPOOL_H__

// Other includes
#include "jsapi.h"
#include "nsCOMPtr.h"
#include "nsStringGlue.h"
#include "nsTArray.h"
#include "prmon.h"

class nsDOMWorker;
class nsIDocument;
class nsIScriptContext;
class nsIScriptError;
class nsIScriptGlobalObject;

class nsDOMWorkerPool
{
public:
  nsDOMWorkerPool(nsIScriptGlobalObject* aGlobalObject,
                  nsIDocument* aDocument);

  NS_IMETHOD_(nsrefcnt) AddRef();
  NS_IMETHOD_(nsrefcnt) Release();

  nsIScriptGlobalObject* ScriptGlobalObject() {
    return mParentGlobal;
  }

  nsIDocument* ParentDocument() {
    return mParentDocument;
  }

  nsresult Init();

  void Cancel();
  void Suspend();
  void Resume();

  nsresult NoteWorker(nsDOMWorker* aWorker);
  void NoteDyingWorker(nsDOMWorker* aWorker);

  PRMonitor* Monitor() {
    return mMonitor;
  }

private:
  virtual ~nsDOMWorkerPool();

  void GetWorkers(nsTArray<nsDOMWorker*>& aArray);

  nsAutoRefCnt mRefCnt;

  // Reference to the window that created and owns this pool.
  nsCOMPtr<nsIScriptGlobalObject> mParentGlobal;

  // Reference to the document that created this pool.
  nsCOMPtr<nsIDocument> mParentDocument;

  // Weak array of workers. The idea is that workers can be garbage collected
  // independently of the owning pool and other workers.
  nsTArray<nsDOMWorker*> mWorkers;

  // Monitor for suspending and resuming workers.
  PRMonitor* mMonitor;

  PRPackedBool mCanceled;
  PRPackedBool mSuspended;
};

#endif /* __NSDOMWORKERPOOL_H__ */
