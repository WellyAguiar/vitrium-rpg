import { prisma } from "../prisma";

export default async function Home() {
  const users = await prisma.user
    .findMany({
      take: 10,
      orderBy: {
        createdAt: "desc",
      },
    })
    .catch(() => undefined);

  return (
    <main>
      <h1>create-prisma + next</h1>
      <p>Project is ready with Next.js App Router and Prisma 7.</p>
      <h2>Users</h2>
      {!users ? (
        <p>
          Could not query users yet. Run the <code>db:migrate</code> script, then refresh.
        </p>
      ) : users.length === 0 ? (
        <p>No users yet.</p>
      ) : (
        <ul>
          {users.map((user) => (
            <li key={user.id}>
              <strong>{user.email}</strong>
              {user.name ? <span> - {user.name}</span> : null}
            </li>
          ))}
        </ul>
      )}
    </main>
  );
}
