---
description: >-
  These FAQs are designed to help beginner users understand and navigate issues
  related to rate limits when interacting with ThorNode's Solana RPC nodes and
  bots.
---

# Frequently Asked Questions (FAQs) for Solana Beginners

**1. What is Solana?**

* Solana is a high-speed, high-throughput blockchain known for its unique approach to processing transactions and maintaining network efficiency.

**2. How are transactions confirmed in Solana?**

* Transactions in Solana are confirmed through a process involving validators and RPC (Remote Procedure Call) nodes. A transaction includes a message, a list of signatures, and a recent blockhash. Validators are responsible for producing blocks and validating transactions, while RPC nodes act as intermediaries between clients and validators.

**3. What is the role of a blockhash in Solana transactions?**

* The blockhash in a Solana transaction acts as a timestamp and ensures that transactions are processed within a specific timeframe, preventing double processing and ensuring currentness.

**4. What is a validator and what does it do?**

* Validators in Solana are responsible for producing blocks, validating transactions, and maintaining the blockchain's integrity. They use the Proof of History (PoH) mechanism to establish a trusted sequence of events.

**5. What is an RPC node and its function?**

* RPC nodes serve as intermediaries between clients (like wallets or applications) and validators. They handle client requests for submitting transactions, provide information such as blockhashes and account data, and forward transactions to validators.

**6. How does network congestion affect Solana?**

* During network congestion, when the volume of transactions exceeds what validators can process timely, it can lead to delays in transaction processing, longer confirmation times even drops. Validators may struggle with backlogs, and RPC nodes can experience slower response times and increased latency.

**7. What happens to transactions during congestion?**

* Transactions might expire before being processed due to the recent blockhash mechanism, requiring users to resubmit them. Validators balance processing new transactions with maintaining ledger integrity, which is challenging during peak loads.

**8. Can RPC nodes solve congestion issues?**

* While RPC nodes can optimize client request handling and improve user experience, they cannot independently resolve congestion issues within the blockchain itself. The solution largely relies on the network's scalability and validators' efficiency.

**9. Why is understanding Solana important?**

* Understanding Solana's transaction processing, network congestion, and the roles of validators and RPC nodes is crucial for developers and users navigating this advanced blockchain technology.

**10. What should I do if my transaction is taking too long to confirm on Solana?**

* If your transaction is delayed, check the network's current congestion level. You may need to resubmit your transaction with a newer blockhash if the original one has expired.

**11. How can I check the status of my transaction on the Solana network?**

* You can use a Solana block explorer or your wallet's transaction history to check the status. Look for the transaction ID or signature for detailed information.

**12. What causes a transaction to fail on Solana?**

* Transactions can fail due to reasons like an invalid blockhash (if it's too old), insufficient funds, incorrect account details, or network congestion.

**13.Why does a blockhash expire in Solana?**

* Blockhashes in Solana expire to maintain network security and efficiency. They prevent replay attacks, manage the blockchain state, and ensure transaction relevance by requiring transactions to be processed in a timely manner.

**14.Is the expiration of a blockhash related to RPC nodes or validators?**

* The expiration of a blockhash is more directly related to validators. Validators enforce the blockhash expiration to ensure transaction security and efficiency, whereas RPC nodes facilitate transaction communication without influencing blockhash expiration rules.

**15. Can I cancel a transaction once it's submitted to the Solana network?**

* Once submitted, a transaction cannot be canceled as it's already in the process of being confirmed by validators. It can only fail or succeed.

**16. How do I ensure my transaction is processed quickly on Solana?**

* To expedite processing, ensure your transaction has a recent blockhash and sufficient priority fees. Avoid submitting during peak congestion times if possible or try sending transactions in bulk aka by spamming.

**17. How can I avoid my transaction expiring due to the blockhash being too old?**

* Regularly update the blockhash in your transaction, especially during times of high congestion, to prevent it from expiring.

**18. Can network congestion affect the success rate of my transactions on Solana?**

* Yes, during high congestion, there's a higher chance of transactions expiring or being delayed, which can affect their success rate.

**19. Why is my transaction dropped on the Solana network?**

* Transactions may be dropped due to expired blockhashes, network congestion, insufficient fees, invalid transaction structure, or issues with the RPC node forwarding the transaction.

**20. Why can't I see my transaction on a Solana blockchain explorer?**

* This could be due to propagation delays, searching with incorrect information, dropped transactions, or synchronization issues with the explorer itself.

**21. I sent 50 transactions, but only 3 appear on the blockchain explorer. Why?**

* This discrepancy might be caused by network congestion, batch processing delays by validators, expired blockhashes, or issues with the RPC node forwarding the transaction.

**22. What is the difference between TPS and RPS in blockchain context?**

* TPS (Transactions Per Second) measures the number of transactions a blockchain network can process each second, while RPS (Requests Per Second) refers to the number of requests (including transactions and data queries) that an RPC node or server can handle per second.

**23. What does a 429 Rate Limit Error mean when using Solana RPC nodes?**

* A 429 Rate Limit Error indicates that you have exceeded the number of requests allowed by the RPC node within a given time frame. This is a common rate limiting mechanism to prevent overuse of resources. If you encounter this error, you should reduce the frequency of your requests to stay within the node's limits.

**24. Why am I getting a 502 Timeout Error after receiving a 429 Error on ThorNode RPC?**

* After repeatedly hitting the rate limit and receiving 429 errors, the RPC node may temporarily block your connection as a protective measure, resulting in 502 Timeout Errors. This block is usually temporary (3 minutes), but you must wait for a certain period before attempting to connect again. Ensure to adjust your request rate to avoid future blocks.

**25. How can I avoid exceeding the rate limit on Solana RPC nodes?**

* To avoid exceeding rate limits, you can:
  1. **Optimize Your Requests:** Make your queries more efficient by requesting only the necessary data.
  2. **Implement Caching:** Cache responses locally to reduce the need for repeated requests.
  3. **Use Multiple RPC Nodes:** Distribute your requests across multiple RPC nodes to spread the load.
  4. **Adhere to Node Guidelines:** Familiarize yourself with the specific rate limits of the RPC node you are using and adjust your request patterns accordingly.

**26. What should I do if my access to an RPC node is blocked due to exceeding rate limits?**

* If you're blocked, you should:
  1. **Wait for the Block to Lift:** Blocks are usually temporary (3 minutes), so wait for the specified duration before trying again.
  2. **Review Your Request Patterns:** Understand why your requests exceeded the limit and modify your approach.
  3. **Contact Node Support:** If you believe the block is in error or need more information, contact the support team of the RPC node service.

**27. What does a 403 Error mean when accessing RPC nodes and how can I resolve it?**

* A 403 Error typically indicates that access to the RPC node is forbidden due to authorization issues. To resolve this:
  1. **Authenticate Your IP:** Use the AuthDashboard discord bot to authenticate your IP address.
  2. **Disable IPv6:** If the issue persists, disable IPv6 on your device or network. ThorNode only supports IPv4, so disabling IPv6 can resolve the issue.
  3. **Verify by Opening RPC URL in Browser:** To confirm that the issue is resolved, open the RPC node's URL in your web browser. You should see an "HTTP POST not allowed" error, which is normal for RPC URLs accessed via a browser. If you still see the 403 error, the authorization issue persists.

**28. How can I measure the latency of an RPC node?**

* To measure the latency to an RPC node, you can use the ping command in the command prompt or terminal. Here's how you can do it:
  1. **Open Command Prompt or Terminal:** On Windows, you can open Command Prompt by searching for `cmd` in the start menu. On macOS or Linux, open the Terminal.
  2. **Run the Ping Command:** Type the ping command followed by the RPC node's domain. For example, `ping rpc-de.thornode.io`.
  3. **Analyze the Results:** The output will show the time in milliseconds it takes for a packet to travel from your computer to the RPC node and back (round-trip time). This time represents the latency. Lower values indicate better latency.

**29. What is the Max Compute Limit for each block on Solana?**

* Solana sets a maximum compute limit per block to ensure network stability and efficiency. Each program in Solana, like the TOKEN PROGRAM, has a limit of around 12 million Compute Units (CUs). This limit roughly translates to the capacity for processing about 150 transactions per block for that program.

**30. How is the transaction capacity in the TOKEN PROGRAM distributed among different projects like Orca, Raydium, etc.?**

* The transaction capacity in the TOKEN PROGRAM is shared among various projects and platforms like Orca, Raydium, Lifinity, Meteora, and others. This shared capacity means that during times of high demand, transactions from these different platforms compete for the same limited compute resources.

**31. Why might my transaction fail or not get accepted in a Solana block?**

* On Solana, it's normal for a transaction to fail or not be accepted in a block, especially during times of high network demand. This is due to the compute limit per block and the shared transaction capacity among various projects. It's not necessarily a problem with the node or the network; it's just how Solana currently operates.

**32. What should I consider when setting the compute limit in my transactions on Solana?**

* Be cautious with the compute limit you set in your transactions. Unlike other blockchains like Ethereum or Binance Smart Chain, where you pay for the actual compute used, Solana charges you for the total compute limit set, whether it's fully used or not. Setting it too high can lead to higher transaction fees. For instance, a normal swap on Raydium might use around 90K CUs, but some users set their limit higher to be safe. However, remember that you pay for the total amount set in the compute limit on Solana.

**33. Does changing the default compute limit affect transaction success when sniping on Solana?**

* Adjusting the compute limit can impact your transaction success, especially in high-demand scenarios like token sniping. Setting a higher limit may increase the chances of your transaction being processed, but it also incurs higher fees. It's a balance between ensuring your transaction gets through and managing the cost.

**34. Why is my transaction getting late confirmations?**

1. **Network Congestion:** High network traffic can cause a backlog, leading to delayed confirmations.
2. **Transaction Prioritization:** Transactions with higher fees or simpler computations may be prioritized by validators.
3. **Variability in Validator Performance:** Differences in validators' processing speeds can affect confirmation times.
4. **Blockhash Expiration Risk:** Transactions with near-expiring blockhashes might be deprioritized.
5. **Use of Stale Blockhash:** A blockhash that isn’t the most recent can lead to initial delays.
6. **RPC max\_retry Settings:** Setting `max_retry` or similar setting (for RPC) higher than 0 in your bot configuration can lead to re-broadcasting of the transaction. While this can be useful in ensuring your transaction is eventually processed, it can also lead to unnecessary delays, especially during periods of congestion. Re-broadcasted transactions might be treated as new by the network, pushing back their confirmation.
7. **Setting max\_retry to 0:** To avoid late confirmations, consider setting `max_retry` or similar setting to 0. This prevents the RPC node from re-attempting the transaction submission, which can help in reducing confirmation delays.
8. **Preflight Check Settings:** Setting the preflight check to false can also impact transaction processing. While this can speed up the submission process, it increases the risk of failed or dropped transactions, as it bypasses the initial safety checks.
9. **Balancing Retry Settings:** It's advisable to use the RPC retry feature under normal network conditions. However, during times of high congestion, disabling max retry (`max_retry` set to 0) can be more effective in avoiding late confirmations.

* Remember, these settings can have trade-offs. Disabling retries or preflight checks might reduce delays in confirmations but can increase the likelihood of transaction failures or drops. Adjust these settings based on your specific needs and the current network conditions.

<br>
